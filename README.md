# LTSC-Add-MicrosoftStore
Add Windows Store to Windows 11 24H2 LTSC

## To install, follow these steps:
Run `Add-Store.cmd` as Administrator
> [!IMPORTANT]
> Ensure you have administrative privileges when executing this file to allow for proper installation.

### Customize Your Installation
> [!TIP]
> If you do not require certain features such as App Installer, Purchase App, or Xbox Identity, you can delete their corresponding `.appxbundle` / `.msixbundle` files before running the installation.

> [!NOTE]
> If you plan to use games or apps that involve in-app purchases, it's recommended to keep all components.

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
