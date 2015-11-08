# To launch PowerShell scripts, run as Admin in PowerShell:
Set-ExecutionPolicy RemoteSigned

# Enable remote PS command (as Admin)
Enable-PSRemoting -SkipNetworkProfileCheck -Force
Set-NetFirewallRule –Name "WINRM-HTTP-In-TCP-PUBLIC" –RemoteAddress Any

# Make a test
Test-WsMan vm-winsrv-test

# Disable firewall
netsh advfirewall set allprofiles state off

# Whan want to use IPs, on both servers run:
Set-Item wsman:\localhost\client\trustedhosts *
Restart-Service WinRM

# Resources
Enable-PSRemoting - https://technet.microsoft.com/en-us/library/hh849694.aspx



# Remote Desktop MAnager - has an API in powreshell to manage TEamViewer sessions
http://help.remotedesktopmanager.com/index.html?get_rdm_session.htm