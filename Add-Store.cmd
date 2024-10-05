@echo off
:: Check Windows version (Windows 11 24H2 minimum required)
for /f "tokens=6 delims=[]. " %%G in ('ver') do if %%G lss 16299 goto :version

:: Check if script is run with administrative privileges
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || goto :uac

:: Enable extensions and set architecture type
setlocal enableextensions
if /i "%PROCESSOR_ARCHITECTURE%" equ "AMD64" (
    set "arch=x64"
) else (
    set "arch=arm64"
)

:: Navigate to script directory
cd /d "%~dp0"

:: Verify necessary files exist
if not exist "*WindowsStore*.msixbundle" goto :nofiles
if not exist "*WindowsStore*.xml" goto :nofiles

:: Set file variables
for /f %%i in ('dir /b *WindowsStore*.msixbundle 2^>nul') do set "Store=%%i"
for /f %%i in ('dir /b *NET.Native.Framework*.appx 2^>nul ^| find /i "x64"') do set "Framework6X64=%%i"
for /f %%i in ('dir /b *NET.Native.Framework*.appx 2^>nul ^| find /i "arm64"') do set "Framework6arm64=%%i"
for /f %%i in ('dir /b *NET.Native.Runtime*.appx 2^>nul ^| find /i "x64"') do set "Runtime6X64=%%i"
for /f %%i in ('dir /b *NET.Native.Runtime*.appx 2^>nul ^| find /i "arm64"') do set "Runtime6arm64=%%i"
for /f %%i in ('dir /b *VCLibs*.appx 2^>nul ^| find /i "x64"') do set "VCLibsX64=%%i"
for /f %%i in ('dir /b *VCLibs*.appx 2^>nul ^| find /i "arm64"') do set "VCLibsarm64=%%i"

:: Check optional components
if exist "*StorePurchaseApp*.appxbundle" if exist "*StorePurchaseApp*.xml" (
    for /f %%i in ('dir /b *StorePurchaseApp*.appxbundle 2^>nul') do set "PurchaseApp=%%i"
)
if exist "*DesktopAppInstaller*.msixbundle" if exist "*DesktopAppInstaller*.xml" (
    for /f %%i in ('dir /b *DesktopAppInstaller*.msixbundle 2^>nul') do set "AppInstaller=%%i"
)
if exist "*XboxIdentityProvider*.msixbundle" if exist "*XboxIdentityProvider*.xml" (
    for /f %%i in ('dir /b *XboxIdentityProvider*.appxbundle 2^>nul') do set "XboxIdentity=%%i"
)

:: Set dependencies based on architecture
if /i %arch%==x64 (
    set "DepStore=%VCLibsX64%,%Framework6X64%,%Runtime6X64%"
    set "DepPurchase=%VCLibsX64%,%Framework6X64%,%Runtime6X64%"
    set "DepXbox=%VCLibsX64%,%Framework6X64%,%Runtime6X64%"
    set "DepInstaller=%VCLibsX64%"
) else (
    set "DepStore=%VCLibsarm64%,%Framework6arm64%,%Runtime6arm64%"
    set "DepPurchase=%VCLibsarm64%,%Framework6arm64%,%Runtime6arm64%"
    set "DepXbox=%VCLibsarm64%,%Framework6arm64%,%Runtime6arm64%"
    set "DepInstaller=%VCLibsarm64%"
)

:: Verify all dependencies exist
for %%i in (%DepStore%) do (
    if not exist "%%i" goto :nofiles
)

:: PowerShell command setup
set "PScommand=PowerShell -NoLogo -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass"

:: Add Microsoft Store
echo.
echo ============================================================
echo Installing Microsoft Store
echo ============================================================
echo.

1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath %Store% -DependencyPackagePath %DepStore% -LicensePath Microsoft.WindowsStore_8wekyb3d8bbwe.xml
for %%i in (%DepStore%) do (
    %PScommand% Add-AppxPackage -Path %%i
)
%PScommand% Add-AppxPackage -Path %Store%

:: Optional components installation
if defined PurchaseApp (
    echo.
    echo ============================================================
    echo Installing Store Purchase App
    echo ============================================================
    echo.
    1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath %PurchaseApp% -DependencyPackagePath %DepPurchase% -LicensePath Microsoft.StorePurchaseApp_8wekyb3d8bbwe.xml
    %PScommand% Add-AppxPackage -Path %PurchaseApp%
)

if defined AppInstaller (
    echo.
    echo ============================================================
    echo Installing App Installer
    echo ============================================================
    echo.
    1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath %AppInstaller% -DependencyPackagePath %DepInstaller% -LicensePath Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.xml
    %PScommand% Add-AppxPackage -Path %AppInstaller%
)

if defined XboxIdentity (
    echo.
    echo ============================================================
    echo Installing Xbox Identity Provider
    echo ============================================================
    echo.
    1>nul 2>nul %PScommand% Add-AppxProvisionedPackage -Online -PackagePath %XboxIdentity% -DependencyPackagePath %DepXbox% -LicensePath Microsoft.XboxIdentityProvider_8wekyb3d8bbwe.xml
    %PScommand% Add-AppxPackage -Path %XboxIdentity%
)

goto :fin

:uac
echo.
echo ============================================================
echo Error: Please run the script as Administrator
echo ============================================================
echo.
echo Press any key to exit.
pause >nul
exit

:version
echo.
echo ============================================================
echo Error: Windows 11 24H2 (version 26100 or later) required
echo ============================================================
echo.
echo Press any key to exit.
pause >nul
exit

:nofiles
echo.
echo ============================================================
echo Error: Required files are missing in the current directory
echo ============================================================
echo.
echo Press any key to exit.
pause >nul
exit

:fin
echo.
echo ============================================================
echo Installation Complete
echo ============================================================
echo.
echo Press any key to exit.
pause >nul
exit
