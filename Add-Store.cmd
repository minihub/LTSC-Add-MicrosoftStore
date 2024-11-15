@echo off
:: Check Windows version (Windows 11 24H2 minimum required)
for /f "tokens=6 delims=[]. " %%G in ('ver') do if %%G lss 16299 goto :version

:: Check if script is run with administrative privileges
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || goto :uac

:: Enable extensions and set architecture type
setlocal enableextensions
set "arch=%PROCESSOR_ARCHITECTURE%"
if /i "%arch%" equ "AMD64" set "arch=x64" || set "arch=arm64"

:: Navigate to script directory
cd /d "%~dp0"

:: Verify necessary files exist
if not exist "*WindowsStore*.msixbundle" goto :nofiles
if not exist "*WindowsStore*.xml" goto :nofiles

:: Set file variables
for %%i in (*WindowsStore*.msixbundle) do set "Store=%%i"
for %%i in (*NET.Native.Framework*.appx) do (
    if /i "%%~ni"=="*x64*" set "Framework6X64=%%i"
    if /i "%%~ni"=="*arm64*" set "Framework6arm64=%%i"
)
for %%i in (*NET.Native.Runtime*.appx) do (
    if /i "%%~ni"=="*x64*" set "Runtime6X64=%%i"
    if /i "%%~ni"=="*arm64*" set "Runtime6arm64=%%i"
)
for %%i in (*VCLibs*.appx) do (
    if /i "%%~ni"=="*x64*" set "VCLibsX64=%%i"
    if /i "%%~ni"=="*arm64*" set "VCLibsarm64=%%i"
)

:: Check optional components
for %%i in (StorePurchaseApp DesktopAppInstaller XboxIdentityProvider) do (
    if exist "*%%i*.msixbundle" if exist "*%%i*.xml" (
        for %%j in (*%%i*.msixbundle) do set "%%i=%%j"
    )
)

:: Set dependencies based on architecture
set "DepStore=%VCLibs%Framework%Runtime%"
set "DepPurchase=%DepStore%"
set "DepXbox=%DepStore%"
set "DepInstaller=%VCLibs%"

if /i "%arch%"=="arm64" (
    set "DepStore=%VCLibsarm64%,%Framework6arm64%,%Runtime6arm64%"
    set "DepPurchase=%DepStore%"
    set "DepXbox=%DepStore%"
    set "DepInstaller=%VCLibsarm64%"
)

:: Verify all dependencies exist
for %%i in (%DepStore%) do if not exist "%%i" goto :nofiles

:: PowerShell command setup
set "PScommand=PowerShell -NoLogo -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass"

:: Function to install packages
:install_package
set "pkg=%~1"
set "dep=%~2"
set "license=%~3"
if defined pkg (
    echo.
    echo ============================================================
    echo Installing %pkg%
    echo ============================================================
    echo.
    1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath !pkg! -DependencyPackagePath !dep! -LicensePath !license!
    %PScommand% Add-AppxPackage -Path !pkg!
)
goto :eof

:: Add Microsoft Store
call :install_package "%Store%" "%DepStore%" "Microsoft.WindowsStore_8wekyb3d8bbwe.xml"

:: Optional components installation
call :install_package "%PurchaseApp%" "%DepPurchase%" "Microsoft.StorePurchaseApp_8wekyb3d8bbwe.xml"
call :install_package "%AppInstaller%" "%DepInstaller%" "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.xml"
call :install_package "%XboxIdentity%" "%DepXbox%" "Microsoft.XboxIdentityProvider_8wekyb3d8bbwe.xml"

goto :fin

:uac
echo.
echo ============================================================
echo Error: Please run the script as Administrator
echo ============================================================
echo.
pause >nul
exit

:version
echo.
echo ============================================================
echo Error: Windows 11 24H2 (version 26100 or later) required
echo ============================================================
echo.
pause >nul
exit

:nofiles
echo.
echo ============================================================
echo Error: Required files are missing in the current directory
echo ============================================================
echo.
pause
