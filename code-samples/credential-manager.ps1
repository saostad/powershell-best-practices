# Read stored credentials from windows credential manager
# https://www.powershellgallery.com/packages/CredentialManager/2.0
# Install-Module -Name CredentialManager

try {  
  Import-Module CredentialManager 
  
  $MyCred = Get-StoredCredential -Target 'azure-db'
  
  $UserName = $MyCred.UserName
  $Password = $MyCred.GetNetworkCredential().Password
}
catch {
  $_.Exception | Write-Error
}

# Example How to use it
# Invoke-Sqlcmd -Credential $MyCred -OtherParameters
