Set-ExecutionPolicy -ExecutionPolicy Bypass -Confirm:$False -Force 

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 

$repository = (Get-PSRepository).name 
if ($repository -ne 'PSGallery') 
{ 
Register-PSRepository -Default -Confirm:$False -Force 
} 

Install-Module -Name MSOnline -Confirm:$False -Force 
Install-Module -Name AzureAD -Confirm:$False -Force 
Install-Module -Name ExchangeOnlineManagement -Confirm:$False -Force 
Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Confirm:$False -Force 
Install-Module -Name SharePointPnPPowerShellOnline -Confirm:$False -Force 
Install-Module -Name MicrosoftTeams -Confirm:$False -Force 
Install-Module -Name MSGraphFunctions -Confirm:$False -Force 
Install-Module -Name IntuneBackupAndRestore -Confirm:$False -Force 
Install-Module -Name Microsoft.Graph.Intune -Confirm:$False -Force 
Install-Module -Name Microsoft.Graph -Confirm:$False -Force 
Install-Module -Name Az.KeyVault -Confirm:$False -Force 
Install-Module -Name Az.Accounts -Confirm:$False -Force 