Set-ExecutionPolicy Bypass -Scope Process -Force;

.\scripts\remove-default-windows-apps.ps1

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

.\scripts\development.ps1
.\scripts\gaming.ps1
