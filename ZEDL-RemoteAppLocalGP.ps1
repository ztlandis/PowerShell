Install-Module -Name PolicyFileEditor -Confirm:$False -Force
Import-Module -Name PolicyFileEditor

$UserDir = "$env:windir\system32\GroupPolicy\User\registry.pol"

$RegPath = 'SOFTWARE\Policies\Microsoft\Workspaces'
$RegName = 'DefaultConnectionURL'
$RegData = 'https://RDS1-zedl.msappproxy.net/rdweb/feed/webfeed.aspx'
$RegType = 'String'

Set-PolicyFileEntry -Path $UserDir -Key $RegPath -ValueName $RegName -Data $RegData -Type $RegType

Gpupdate /Target:User /force