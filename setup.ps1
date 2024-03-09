
# Create Shorcut to application.
$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("C:\Users\Store\Desktop\YourApp.lnk")
$ShortCut.TargetPath="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
$ShortCut.Arguments= "--app="https://YourLink""
$ShortCut.IconLocation= "C:\Your_Icon"
$ShortCut.Save()
Write-Host "Shortcut Created"

# Get Credentials & Lookup Admin Group
$Me = whoami.exe 
$Admins = Get-LocalGroupMember -Name Administrators | 
          Select-Object -ExpandProperty name

# #Enter new computer name.
$CompName = Read-Host "Enter computer name"
Rename-Computer -NewName $CompName -Force -Passthru

# #Create local Admin and give password --Trusted Computers only
$Password = ConvertTo-SecureString "Your Password" -AsPlainText -Force #--Unsecue method
New-LocalUser -Name "HighTouch" -Password $Password -FullName "HighTouch" -Description "Admin local account"
Add-LocalGroupMember -Group "Administrators" -Member "HighTouch"
Write-Host "Admin Created"

#Check if local user is Admin and remove if that is the case.
if ($Admins -Contains $Me) {
Remove-LocalGroupMember -Group "Administrators" -Member $Me
Write-Host $Me + " Admin Removed"
} 

# #Script End


