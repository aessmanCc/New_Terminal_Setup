Desktop Shortcut and Local Admin Setup

This PowerShell script automates the setup of a desktop shortcut to an online application and ensures the presence of a local administrator account on the system. It performs the following tasks:

1. Create Shortcut to Application: Creates a shortcut on the user's desktop that points to an online application using the specified URL.

2. Rename Terminal: Renames the terminal to the name provided by the user.

3. Create Local Admin: Checks for the existence of a local administrator account. If none exists, it creates one with a password specified by the user.

Prerequisites 

- Windows operating system
- PowerShell installed
- Permissions to create shortcuts and manage local users and groups

Usage

1. Open PowerShell with administrative privileges.
2. Navigate to the directory containing the script.
3. Execute the script by running .\setup.ps1.
4. Follow the prompts to enter the computer name and desired password for the local administrator account.

Script Overview

1. Create Shortcut:
- Uses the WScript.Shell COM object to create a shortcut on the user's desktop.
- Specifies the target path (application executable) and command-line arguments to open the application.
- Saves the shortcut.

2. Rename Terminal:
- Prompts the user to enter a new computer name.
- Renames the computer using Rename-Computer cmdlet.

3. Create Local Admin:
- Checks for existing local administrators using Get-LocalGroupMember.
- If no local admin exists, prompts the user to enter a password for the new admin account.
- Creates a new local user account with administrator privileges using New-LocalUser.
- Adds the new user to the Administrators group using Add-LocalGroupMember.

4. Remove Current Admin:
- Checks if the current user is a member of the Administrators group.
- If so, removes the user from the group using Remove-LocalGroupMember.

Notes

- This script assumes Trusted Computers only for creating local admins and setting passwords in plaintext. Ensure appropriate security measures in place.
- Customize the script variables (e.g., target path, icon location) according to your application requirements.
- Always review and test scripts in a controlled environment before deploying to production systems.