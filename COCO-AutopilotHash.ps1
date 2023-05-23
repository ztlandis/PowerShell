#Requires -RunAsAdministrator
"Uploading Autopilot hash to Cocokids tenant."
$tenant_id = "c2491323-56e4-4892-8e44-c38a87fa4f07"
$app_id = "b3f6a1d7-6fd1-4bde-8cb5-a06e2af604c2"
$app_secret = "KXZ8Q~Ex~qTxMJFsgjdeOXk0-GMr7CDaRxIuic-8"

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Confirm:$false -Force:$true
Install-Script get-windowsautopilotinfo -Confirm:$false -Force:$true
Get-WindowsAutopilotInfo -Online -TenantId $tenant_id -AppId $app_id -AppSecret $app_secret
