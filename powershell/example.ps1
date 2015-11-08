$UserName = "DOMAIN\USER"
$EncryptedPassword  = "..."

# HOWTO create encrypted password?
# $SecurePassword = $password | ConvertTo-SecureString -AsPlainText -Force
# $EncryptedPassword = ConvertFrom-SecureString -SecureString $SecurePassword


$SecurePassword = ConvertTo-SecureString -String $EncryptedPassword
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName, $SecurePassword

$serv = New-PSSession -ComputerName vm-winsrv-test -Credential $Credentials

"### Connecting at $(Get-Date)"
Invoke-Command -Session $serv -ScriptBlock {
  "### Connected to $env:username@$env:computername"

  "### Copying latest release of ..."
  Copy-Item Y:\latest_release\* c:\tmp\

  "### Running scripts"
  # . Y:\scripts\script.ps1   # UNCOMMENT THIS

  # TODO Service actions
}

"### Done at $(Get-Date)"