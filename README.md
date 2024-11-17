# LTSC-Add-MicrosoftStore
Add Windows Store to Windows 11 24H2 LTSC

The LTSC variant of Windows 11 24H2 does not include the Microsoft Store app by default. If you need to use it, you'll have to install the app manually, as Microsoft does not provide a straightforward installation method. The process is similar to customizing a Windows 11 Enterprise system, as outlined in the article ["Add languages to a Windows 11 Enterprise image"](https://learn.microsoft.com/en-us/azure/virtual-desktop/windows-11-language-packs). However, since Microsoft's installation includes a lot of additional apps, this guide provides the minimal components required to get the Microsoft Store app working with your Windows 11 24H2 LTSC installation.

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

|Name|Size|Link|
|:---|---:|---:|
|AV1VideoExtension|4.56 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.AV1VideoExtension.zip)|
|AVCEncoderVideoExtension|7.91 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.AVCEncoderVideoExtension.zip)|
|Alarms|29.4 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAlarms.zip)|
|AppRuntime|120 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsAppRuntime.zip)|
|ApplicationCompatibilityEnhancements|6.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.ApplicationCompatibilityEnhancements.zip)|
|AutoSuperResolution|11 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.AutoSuperResolution.zip)|
|BingNews|35 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.BingNews.zip)|
|BingSearch|1.11 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.BingSearch.zip)|
|BingWeather|36 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.BingWeather.zip)|
|Calculator|27.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsCalculator.zip)|
|Camera|21.4 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsCamera.zip)|
|Client.WebExperience|36.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MicrosoftWindows.Client.WebExperience.zip)|
|Clipchamp|15.2 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Clipchamp.Clipchamp.zip)|
|CrossDevice|7.68 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MicrosoftWindows.CrossDevice.zip)|
|D3DMappingLayers|105 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.D3DMappingLayers.zip)|
|DevHome|379 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/DevHome.zip)|
|Family|1.06 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MicrosoftCorporationII.MicrosoftFamily.zip)|
|FeedbackHub|35.7 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsFeedbackHub.zip)|
|FlipGridPWA|49.3 KB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/FlipGridPWA.zip)|
|GamingApp|331 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.GamingApp.zip)|
|GetHelp|20.8 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.GetHelp.zip)|
|HEIFImageExtension|6.5 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.HEIFImageExtension.zip)|
|Journal|487 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftJournal.zip)|
|MPEG2VideoExtension|2.3 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MPEG2VideoExtension.zip)|
|Messaging|32.7 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Messaging.zip)|
|NET.Native.Framework/Runtime|4.93 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.NET.Native.zip)|
|Notepad|11.4 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsNotepad.zip)|
|OfficeHub|14.4 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftOfficeHub.zip)|
|OneConnect|14.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.OneConnect.zip)|
|OutlookForWindows|24.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.OutlookForWindows.zip)|
|PCManager|26.1 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftPCManager.zip)|
|Paint|8.26 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Paint.zip)|
|Photos|20.8 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Windows.Photos.zip)|
|PowerAutomateDesktop|430 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.PowerAutomateDesktop.zip)|
|QuickAssist|4.32 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MicrosoftCorporationII.QuickAssist.zip)|
|RawImageExtension|2.84 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.RawImageExtension.zip)|
|ScreenSketch|6.77 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.ScreenSketch.zip)|
|SecHealthUI|14.2 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.SecHealthUI.zip)|
|Services.Store.Engagement|580 KB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Services.Store.Engagement.zip)|
|SolitaireCollection|124 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftSolitaireCollection.zip)|
|SoundRecorder|8.33 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsSoundRecorder.zip)|
|StickyNotes|41.8 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.MicrosoftStickyNotes.zip)|
|Teams|8.04 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/MSTeams.zip)|
|Terminal|19.8 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WindowsTerminal.zip)|
|Todos|84.3 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Todos.zip)|
|UI.Xaml|23.7 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.UI.Xaml.zip)|
|VCLibs|2.93 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VCLibs.zip)|
|VP9VideoExtensions|6.62 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.VP9VideoExtensions.zip)|
|WebMediaExtensions|3.05 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WebMediaExtensions.zip)|
|WebpImageExtension|1.09 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.WebpImageExtension.zip)|
|Whiteboard|604 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Whiteboard.zip)|
|Xbox.TCUI|10.6 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.Xbox.TCUI.zip)|
|XboxGamingOverlay|6.43 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.XboxGamingOverlay.zip)|
|XboxIdentityProvider|18.1 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.XboxIdentityProvider.zip)|
|XboxSpeechToTextOverlay|1.49 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.XboxSpeechToTextOverlay.zip)|
|YourPhone|395 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.YourPhone.zip)|
|ZuneMusic|36.7 MB|[Download](https://github.com/minihub/LTSC-Add-MicrosoftStore/releases/download/LTSC-Add-MicrosoftStore-24H2/Microsoft.ZuneMusic.zip)|
