# Windows 10 Initial Setup

This repo contains scripts to setup my PC after a clean install of Windows 10.

## Set the `Unrestricted` Execution Policy

In order to be able to execute the scripts in the repository, you need to have the `Unrestricted` execution policy set in PowerShell. The easiest way to do it is to set an execution policy for the current PowerShell process, this will not change any system wide execution policies. Open PowerShell as an Administrator and execute the following:

```
Set-ExecutionPolicy Bypass -Scope Process -Force;
```

Now you can run any of the `.ps1` scripts in the current PowerShell process.

See the [Microsoft Documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2) for details about the execution policies.

## Remove Default Windows 10 Apps

To remove the default Windows 10 apps run:

```
.\scripts\remove-default-windows-apps.ps1
```

You can see the full list of installed apps by running:

```
Get-AppxPackage –AllUsers | Select Name, PackageFullName
```

You can update the `remove-default-windows-apps.ps1` script with any items from the resulting list.

## Install Applications Using Chocolatey

### Install Chocolatey

To install Chocolatey run:

```
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

You can update any of the scripts that install apps by searching the [Chocolatey Community Registry](https://community.chocolatey.org/) for any apps you want to install and updating the appropriate script before running it.

### Install Development Tools

To install the software development tools run:

```
.\scripts\development.ps1
```

### Install Gaming Tools

To install the software development tools run:

```
.\scripts\gaming.ps1
```
