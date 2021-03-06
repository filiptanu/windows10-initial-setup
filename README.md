# Windows 10 Initial Setup

This repo contains scripts to setup my PC after a clean install of Windows 10. It is using [Chocolatey](https://chocolatey.org/) - a package manager for Windows, to install all the required software packages.

## tl;dr version

To set up everything with one command, open PowerShell as an Administrator and run:

```
Set-ExecutionPolicy Bypass -Scope Process -Force;

.\install.ps1
```

If you want to install only specific packages, or want to go through the process step by step, continue reading.

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

### Install Windows Essentials

To install the Windows essential apps run:

```
.\scripts\essentials.ps1
```

### Install Development Tools

To install the software development tools run:

```
.\scripts\development.ps1
```

#### Install Windows Subsystem for Linux 2

This section has not been added to the `development.ps1` script, since it requires the computer to be restarted after running some of the commands. If WSL2 is installed, Docker can be run on top of it. See [this documentation](https://docs.docker.com/desktop/windows/wsl/) for more details.

To install WSL2, first you need to enable few Windows optional features. You will need to restart your computer once you run those.

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -All # requires restart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All # requires restart
```

After you have restarted your computer, you can run:

```
choco install wsl2 -y
choco install wsl-ubuntu-2004 -y
```

to install WSL2 and Ubuntu 20.04 running on top of it.

### Install Gaming Tools

To install the gaming development tools run:

```
.\scripts\gaming.ps1
```

### Install Crypto Tools

To install the crypto tools run:

```
.\scripts\crypto.ps1
```

### Install Miscellaneous Tools

To install other miscellaneous tools run:

```
.\scripts\miscellaneous.ps1
```

### Upgrade Installed Packages

Down the line, if you want to upgrade all installed packages (including Chocolatey), open PowerShell as an Administrator and run:

```
Set-ExecutionPolicy Bypass -Scope Process -Force;

.\upgrade.ps1
```
