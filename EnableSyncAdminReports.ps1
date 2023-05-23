Set-ExecutionPolicy -executionpolicy Undefined -Scope LocalMachine
$KeyPath = "HKLM:\SOFTWARE\Policies\Microsoft\OneDrive"
$ValueName = "EnableSyncAdminReports"
$ValueData = "1"
try{
    Get-ItemProperty -Path $KeyPath -Name $valueName -ErrorAction Stop
}
catch [System.Management.Automation.ItemNotFoundException] {
    New-Item -Path $KeyPath -Force
    New-ItemProperty -Path $KeyPath -Name $ValueName -Value $ValueData -Force
}
catch {
    New-ItemProperty -Path $KeyPath -Name $ValueName -Value $ValueData -Type DWORD -Force
}