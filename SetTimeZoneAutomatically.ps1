Set-ExecutionPolicy -executionpolicy Undefined -Scope LocalMachine
$KeyPath1 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location"
$KeyPath2 = "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate"
$ValueName1 = "Value"
$ValueData1 = "Allow"
$ValueName2 = "Start"
$ValueData2 = "3"

New-ItemProperty -Path $KeyPath1 -Name $ValueName1 -Value $ValueData1 -Type string -Force
New-ItemProperty -Path $KeyPath2 -Name $ValueName2 -Value $ValueData2 -Type DWORD -Force
