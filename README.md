# LTSC-Add-MicrosoftStore
Add Windows Store to Windows 11 24H2 LTSC

The LTSC variant of Windows 11 24H2 does not include the Microsoft Store app by default. If you need to use it, you'll have to install the app manually, as Microsoft does not provide a straightforward installation method. The process is similar to customizing a Windows 11 Enterprise system, as outlined in the article ["Add languages to a Windows 11 Enterprise image"](https://learn.microsoft.com/en-us/azure/virtual-desktop/windows-11-language-packs). However, since Microsoft's installation includes a lot of additional apps, this guide provides the minimal components required to get the Microsoft Store app working with your Windows 11 24H2 LTSC installation.

## OPTION 1: manual install

[Download full Package](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/LTSC-Add-MicrosoftStore-24H2.zip)

> [!NOTE]
> to install required components:
> 1. <b>Microsoft Store</b></br>
>    requires: [VCLibs](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip), [NET.Native.Framework, NET.Native.Runtime](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip), [UI.Xaml](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip)
> 3. <b>Store Purchase App</b></br>
>    requires: [VCLibs](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip), [NET.Native.Framework, NET.Native.Runtime](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip), [UI.Xaml](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip)
> 5. <b>Desktop App Installer</b></br>
>    requires: [VCLibs](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip), [UI.Xaml](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip)

## To install, follow these steps:
Run `Add-Store.cmd` as Administrator
> [!IMPORTANT]
> Ensure you have administrative privileges when executing this file to allow for proper installation.

### Customize Your Installation
> [!TIP]
> If you do not require certain features such as Desktop App Installer or Purchase App, you can delete their corresponding `.appxbundle` / `.msixbundle` files before running the installation. See below list of optional InboxApps.

### Troubleshooting the Store Functionality
- If the Microsoft Store is not functioning correctly after installation, first try rebooting your system.

- If the issue persists, open the Command Prompt as an administrator and run the following command:

  ```PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage Microsoft.WindowsStore).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"```   

  After running the command, reboot your system again.

## Addition troubleshooting    
- right click start  
- select `Run`
- type in: `WSReset.exe`

> [!NOTE]
> This will clear the cache if needed.  

## InboxApps (optional and manually to install)

After installing the Store App from this package, you can simply double klick to install each of the remaining packages as needed (after extracting the content per .ZIP archive).

|Name|Size|Link|Requirements*|
|:---|---:|---:|---:|
|AV1VideoExtension|4.56 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.AV1VideoExtension.zip)|-|
|AVCEncoderVideoExtension|7.91 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.AVCEncoderVideoExtension.zip)|-|
|Alarms|29.4 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAlarms.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|AppRuntime|120 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|-|
|ApplicationCompatibilityEnhancements|6.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.ApplicationCompatibilityEnhancements.zip)|-|
|AutoSuperResolution|11 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.AutoSuperResolution.zip)|-|
|BingNews|35 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.BingNews.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [a] [b]|
|BingSearch|1.11 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.BingSearch.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|BingWeather|36 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.BingWeather.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [a] [b]|
|Calculator|27.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsCalculator.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|Camera|21.4 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsCamera.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|Client.WebExperience|36.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MicrosoftWindows.Client.WebExperience.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|Clipchamp|15.2 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Clipchamp.Clipchamp.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|CrossDevice|7.68 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MicrosoftWindows.CrossDevice.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|D3DMappingLayers|105 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.D3DMappingLayers.zip)|-|
|DevHome|379 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/DevHome.zip)|-|
|Family|1.06 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MicrosoftCorporationII.MicrosoftFamily.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|FeedbackHub|35.7 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsFeedbackHub.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|FlipGridPWA|49.3 KB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/FlipGridPWA.zip)|-|
|GamingApp|331 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.GamingApp.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [a]|
|GetHelp|20.8 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.GetHelp.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|HEIFImageExtension|6.5 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.HEIFImageExtension.zip)|-|
|Journal|487 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftJournal.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|MPEG2VideoExtension|2.3 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MPEG2VideoExtension.zip)|-|
|Messaging|32.7 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Messaging.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|NET.Native.Framework/Runtime|4.93 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|-|
|Notepad|11.4 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsNotepad.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip)|
|OfficeHub|14.4 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftOfficeHub.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|OneConnect|14.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.OneConnect.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|OutlookForWindows|24.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.OutlookForWindows.zip)|-|
|PCManager|26.1 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftPCManager.zip)|[4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|Paint|8.26 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Paint.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [a]|
|Photos|20.8 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Windows.Photos.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip) [5](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Services.Store.Engagement.zip)|
|PowerAutomateDesktop|430 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.PowerAutomateDesktop.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|QuickAssist|4.32 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MicrosoftCorporationII.QuickAssist.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|RawImageExtension|2.84 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.RawImageExtension.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|ScreenSketch|6.77 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.ScreenSketch.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|SecHealthUI|14.2 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.SecHealthUI.zip)|-|
|Services.Store.Engagement|580 KB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Services.Store.Engagement.zip)|-|
|SolitaireCollection|124 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftSolitaireCollection.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|SoundRecorder|8.33 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsSoundRecorder.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|StickyNotes|41.8 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftStickyNotes.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [5](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Services.Store.Engagement.zip)|
|Teams|8.04 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MSTeams.zip)|-|
|Terminal|19.8 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsTerminal.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip)|
|Todos|84.3 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Todos.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [5](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Services.Store.Engagement.zip)|
|UI.Xaml|23.7 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip)|-|
|VCLibs|2.93 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|-|
|VP9VideoExtensions|6.62 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VP9VideoExtensions.zip)|-|
|WebMediaExtensions|3.05 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WebMediaExtensions.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|WebpImageExtension|1.09 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WebpImageExtension.zip)|-|
|Whiteboard|604 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Whiteboard.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|Xbox.TCUI|10.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Xbox.TCUI.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|XboxGamingOverlay|6.43 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.XboxGamingOverlay.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip)|
|XboxIdentityProvider|18.1 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.XboxIdentityProvider.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|XboxSpeechToTextOverlay|1.49 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.XboxSpeechToTextOverlay.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|YourPhone|395 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.YourPhone.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [2](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [4](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|ZuneMusic|36.7 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.ZuneMusic.zip)|[1](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip) [3](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip) [c]|

Requirements*: 
1. VCLibs
2. UI.Xaml
3. NET.Native .Framework & .Runtime
4. AppRuntime
5. Services.Store.Engagement

Requirements* (but embedded in installer):</br></br>
[a] Advertising.Xaml</br>
[b] WinJs</br>
[c] Media.PlayReadyClient</br>

## OPTION 2: automatic install

LTSC editions do not come with store apps pre-installed. To install them, follow the steps below.

1. Make sure the Internet is connected.
2. Open Powershell as admin and enter: `wsreset -i`
3. Wait for a notification to appear that the store app is installed, it may take a few minutes.
4. install [App Installer](https://apps.microsoft.com/detail/9nblggh4nns1). This app is very useful; it includes WinGet, enabling easy installation of .appx packages.
