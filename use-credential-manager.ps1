# Read stored credentials from windows credential manager

try {  
  Import-Module CredentialManager 
  
  $MyCred = Get-StoredCredential -Target 'azure-db'
  
  $UserName = $MyCred.UserName
  $Password = $MyCred.GetNetworkCredential().Password
}
catch {
  Write-Error "Something went wrong while accessing the credentials." 
}

# Example How to use it
# Invoke-Sqlcmd -Credential $MyCred -OtherParameters
