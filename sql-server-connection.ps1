# this function returns a connected connection to microsoft sql server
function CreateConnectionToDB {
  $SQLServer = "DB-ADDRESS"
  $DBName = "MY-DB-NAME"
  
  try {  
    Import-Module CredentialManager 
    
    $MyCred = Get-StoredCredential -Target 'MY-DB-NAME'
    
    $uid = $MyCred.UserName
    $password = $MyCred.GetNetworkCredential().Password
  }
  catch {
    Write-Error "Something went wrong while accessing the credentials." 
  }

  
  $SqlConnection = New-Object System.Data.SqlClient.SqlConnection
  $SqlConnection.ConnectionString = "Server = $SQLServer; Database = $DBName; Integrated Security = False; TimeOut = $Timeout; User ID = $uid; Password = $password"
  
  if ($SqlConnection.State -eq "close") {
    # create a connection to db
    Write-Host "Connecting to DB..." -ForegroundColor Gray -BackgroundColor DarkMagenta
    $SqlConnection.Open()
    if ($SqlConnection.State -eq "open") {
      Write-Host "Connected to DB Successfully!" -ForegroundColor White -BackgroundColor DarkGreen
      return $SqlConnection      
    }
    else {
      Write-Host "Connection to DB failed!" -ForegroundColor Red -BackgroundColor Black
      Write-Host "Retrying to connect to DB..." -ForegroundColor Gray -BackgroundColor DarkMagenta
      return CreateConnectionToDB      
    }
  }
} # CreateConnectionToDB