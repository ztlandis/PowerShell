#Requires -RunAsAdministrator
$User = (Get-WMIObject -class Win32_ComputerSystem | select username).username
$domain,$ADUser = $User.split('\')
$Computer = $Env:COMPUTERNAME

"Removing R drive from $ADUser and moving $Computer to AADWorkstations OU."

Invoke-Command -ComputerName DC-RICHMOND -ScriptBlock {Set-ADUser $Using:ADUser -Clear HomeDirectory}
Invoke-Command -ComputerName DC-RICHMOND -ScriptBlock {Move-ADObject -Identity (Get-ADComputer $Using:Computer).distinguishedname -TargetPath "OU=AADWorkstations,DC=cocokids,DC=org"}