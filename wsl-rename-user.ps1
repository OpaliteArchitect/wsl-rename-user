<#
Copyright 2026 OpaliteArchitect
SPDX-License-Identifier: Apache-2.0
#>

<#
.SYNOPSIS
    Renames a distro user in WSL.

.DESCRIPTION
    Modifies a username inside a specific WSL distribution.
    WARNING: This terminates all active WSL instances.

.PARAMETER Distro
    The name of the WSL distribution (e.g., Ubuntu, Ubuntu-26.04).

.PARAMETER CurrentName
    The current username.

.PARAMETER NewName
    The desired new username.
    
.EXAMPLE
    .\wsl-rename-user.ps1 -Distro "Ubuntu-26.04" -CurrentName "cringename" -NewName "coolname"

    Description:
    Renames the user 'cringename' to 'coolname' inside the Ubuntu-26.04 instance.
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$Distro,

    [Parameter(Mandatory = $true)]
    [string]$CurrentName,

    [Parameter(Mandatory = $true)]
    [string]$NewName
)

Write-Host "Terminating active WSL instances..." -ForegroundColor Cyan
wsl --shutdown

Write-Host "Renaming user and home directory inside Linux..." -ForegroundColor Cyan
wsl -d $Distro -u root -- usermod -l $NewName -m -d /home/$NewName $CurrentName

Write-Host "Renaming primary group..." -ForegroundColor Cyan
wsl -d $Distro -u root -- groupmod -n $NewName $CurrentName

Write-Host "Reconciling default user in wsl.conf..." -ForegroundColor Yellow
wsl -d $Distro -u root -- sed -i "s/default=$CurrentName/default=$NewName/g" /etc/wsl.conf

Write-Host "Restarting WSL to apply changes..." -ForegroundColor Cyan
wsl --shutdown

Write-Host "Done! Launch WSL with 'wsl -d $Distro'" -ForegroundColor Green