# WSL Rename User

A PowerShell script for changing a user's name in Windows Subsystem for Linux 2.

## How to use

I recommend running this inside Windows.

- Open Powershell
- Clone the repo
- Navigate to the directory
  cd .\wsl-rename-user\
- Run .\wsl-rename-user.ps1
- You will be asked for three variables:
  - Distro: The name of the distro containing the user (e.g. Ubuntu).
  - OldUser: The current name of the user
    -NewUser: The new name for the user

## Troubleshooting

- This script assumes you have set the default user inside /etc/wsl.conf of the distro.
  - If you're using the registry, change it with `wsl --manage <distro> --set-default-user <username>` if your user is the default user.
- If Windows policy security prevents you from running powershell scripts, you can bypass it for this session with ``

## License

This project is licensed under Apache 2.0 license.
