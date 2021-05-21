# this function returns a connected connection to microsoft sql server
function CreateDbConnection {    
  param(
    [Parameter(Mandatory = $true)][string]$uid,
    [Parameter(Mandatory = $true)][string]$password,
    [Parameter(Mandatory = $true)][string]$dbName,
    [Parameter(Mandatory = $true)][string]$hostName
  )
  [System.Data.SqlClient.SqlConnection]$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
  $SqlConnection.ConnectionString = "Server = $hostName; Database = $dbName; Integrated Security = False; TimeOut = 100000; User ID = $uid; Password = $password"
  
  if ($SqlConnection.State -eq "close") {
    log -level "progress" -msg "Connecting to DB $dbName host $hostName..."
    $SqlConnection.Open()
    if ($SqlConnection.State -eq "open") {
      log -level "success" -msg "Connected to DB $dbName Successfully!"
      return $SqlConnection      
    }
    else {
      log -level "error" -msg "Connection to DB $dbName failed!"
      log -msg "Retrying to connect to DB $dbName..."
      return CreateDbConnection -uid $uid -password $password -dbName $dbName -hostName $hostName     
    }
  }
} # CreateConnectionToDB
