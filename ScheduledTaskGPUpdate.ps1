#############################################################
# Set Script Values and create the script
#############################################################
$scriptPath = "C:\temp"
$scriptName = "ForceGPUpdate.ps1"
$script = '
gpupdate /target:User /force
'
New-Item -Path $scriptPath\$scriptName -Force
Set-Content -Path $scriptPath\$scriptName -Value $script


#############################################################
#Set Values of Scheduled Task 
#############################################################

$TaskName = "ForceGPUpdateOnLogin"
Get-ScheduledTask | Where-Object {$_.TaskName -eq "$TaskName"} | Unregister-ScheduledTask -confirm:$false
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-WindowStyle hidden -File $scriptPath\$scriptName"
$trigger = New-ScheduledTaskTrigger -AtLogon
$principal = (Get-CimInstance -ClassName Win32_ComputerSystem).Username
$settings = New-ScheduledTaskSettingsSet
Register-ScheduledTask -TaskName $TaskName -Trigger $trigger -User $principal -Action $action -Settings $settings


#############################################################
# Run Scheduled Task
#############################################################
try {
    Start-ScheduledTask -TaskName $TaskName
}
catch {
    Write-Host $Error
    Exit 2000
}