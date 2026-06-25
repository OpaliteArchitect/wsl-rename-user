# WSL Rename User

A PowerShell script for changing a user's name in Windows Subsystem for Linux 2 (WSL2).

## How to use

You need Windows 10/11 with WSL2 installed.

- Open PowerShell inside Windows.
- Clone the repo
  `git clone https://github.com/OpaliteArchitect/wsl-rename-user`
- Navigate to the directory
  `cd .\wsl-rename-user\`
- Run the script `.\wsl-rename-user.ps1`.
  - If Windows policy prevents you from running powershell scripts, you can temporarily bypass it with `PowerShell -ExecutionPolicy Bypass -File wsl-rename-user.ps1` for the duration of the script.
- You will be asked for three variables:
  - **Distro:** The name of the distro containing the user (e.g. Ubuntu)
  - **CurrentName:** The current name of the user
  - **NewName:** The new name for the user
- After the script finishes running, your name will be changed.

## Troubleshooting

- This script modifies the default user inside /etc/wsl.conf.
  - If the user is the default user, and you set it via the registry, change it using `wsl --manage <distro> --set-default-user <new-username>`. (You might need to update WSL if the command is unavailable via `wsl --update`).

## License

This project is licensed under Apache 2.0 license.
