# WSL Rename User

A PowerShell script for changing a user's name in Windows Subsystem for Linux 2 (WSL2).

<img width="1280" height="649" alt="wsl-rename-user" src="https://github.com/user-attachments/assets/5fcf9101-5c0f-4dd7-9b53-04fb3a40b9f4" />

## How to use

You need Windows 10 or 11 with WSL2 installed.

- Open PowerShell inside Windows.
- Clone the repo:
  ```powershell
  git clone https://github.com/OpaliteArchitect/wsl-rename-user
  ```
- Navigate to the directory:
  ```powershell
  cd .\wsl-rename-user\
  ```
- Run the script:
  ```powershell
  .\wsl-rename-user.ps1
  ```
  - If Windows policy prevents you from running PowerShell scripts, you can temporarily bypass it for the duration of the script with:
    ```powershell
    PowerShell -ExecutionPolicy Bypass -File wsl-rename-user.ps1
    ```
- You will be asked for three variables:
  - **Distro:** The name of the distro containing the user (e.g. `Ubuntu`)
  - **CurrentName:** The current name of the user
  - **NewName:** The new name for the user
- After the script finishes running, your name will be changed.

## Troubleshooting

- This script modifies the default user inside `/etc/wsl.conf`.
  - If the user is the default user, and you set it via the registry, change it using:
    ```powershell
    wsl --manage <distro> --set-default-user <new-username>
    ```
    - If the command is unavailable, you might need to update WSL via:
      ```powershell
      wsl --update
      ```

## License

This project is licensed under Apache 2.0 license.
