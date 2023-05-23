"Disabling folder redirection."
$KeyPath1 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
$KeyPath2 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
$ValueName1 = "Personal"
$ValueData1a = "$Env:USERPROFILE\Documents"
$ValueData1b = "%USERPROFILE%\Documents"
$ValueName2 = "Desktop"
$ValueData2a = "$Env:USERPROFILE\Desktop"
$ValueData2b = "%USERPROFILE%\Desktop"
$ValueName3 = "Favorites"
$ValueData3a = "$Env:USERPROFILE\Favorites"
$ValueData3b = "%USERPROFILE%\Favorites"
$ValueName4 = "Pictures"
$ValueData4a = "$Env:USERPROFILE\Pictures"
$ValueData4b = "%USERPROFILE%\Pictures"

set-ItemProperty -path $KeyPath1 -name $ValueName1 $ValueData1a
set-ItemProperty -path $KeyPath2 -name $ValueName1 $ValueData1b

set-ItemProperty -path $KeyPath1 -name $ValueName2 $ValueData2a
set-ItemProperty -path $KeyPath2 -name $ValueName2 $ValueData2b

set-ItemProperty -path $KeyPath1 -name $ValueName3 $ValueData3a
set-ItemProperty -path $KeyPath2 -name $ValueName3 $ValueData3b

set-ItemProperty -path $KeyPath1 -name $ValueName4 $ValueData4a
set-ItemProperty -path $KeyPath2 -name $ValueName4 $ValueData4b

Gpupdate /force

Write-Host -NoNewLine 'Press any key to restart the workstation (There is a 2 minute delay before the reboot will occur).';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

shutdown /r -t 120