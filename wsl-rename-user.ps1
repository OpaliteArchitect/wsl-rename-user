<#
.SYNOPSIS
    !! WARNING: This terminates all active WSL instances.
    Renames a WSL user and optionally sets them as the default user.
.PARAMETER Distro
    The name of the WSL distribution (e.g., Ubuntu, Ubuntu-26.04).
.PARAMETER OldUser
    The current username.
.PARAMETER NewUser
    The desired new username.
.EXAMPLE
    .\Rename-WslUser.ps1 -Distro "Ubuntu-26.04" -OldUser "cringename" -NewUser "coolname"
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$Distro,

    [Parameter(Mandatory = $true)]
    [string]$OldUser,

    [Parameter(Mandatory = $true)]
    [string]$NewUser
)

Write-Host "Terminating active WSL instances..." -ForegroundColor Cyan
wsl --shutdown

Write-Host "Renaming user and home directory inside Linux..." -ForegroundColor Cyan
wsl -d $Distro -u root -- usermod -l $NewUser -m -d /home/$NewUser $OldUser

Write-Host "Renaming primary group..." -ForegroundColor Cyan
wsl -d $Distro -u root -- groupmod -n $NewUser $OldUser

Write-Host "Reconciling wsl.conf default user..." -ForegroundColor Yellow
wsl -d $Distro -u root -- sed -i "s/default=$OldUser/default=$NewUser/g" /etc/wsl.conf

Write-Host "Restarting WSL to apply changes..." -ForegroundColor Cyan
wsl --shutdown

Write-Host "Done! Launch WSL with 'wsl -d $Distro'" -ForegroundColor Green