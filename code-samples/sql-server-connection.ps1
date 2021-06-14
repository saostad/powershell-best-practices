function CreateDbConnection {    
  param(
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$uid,
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$password,
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$dbName,
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$hostName
  )

  try {
    [System.Data.SqlClient.SqlConnection]$SqlConnection = New-Object System.Data.SqlClient.SqlConnection

    $connectionString = "Server = $hostName; Database = $dbName; Integrated Security = False; TimeOut = 100000; User ID = $uid; Password = $password"

    $SqlConnection.ConnectionString = $connectionString
  
    if ($SqlConnection.State -eq "close") {
      log -level "progress" -msg "Connecting to DB $dbName on host $hostName..."
      $SqlConnection.Open()
      if ($SqlConnection.State -eq "open") {
        log -level "success" -msg "Connected to DB $dbName on host $hostName Successfully!"
        return $SqlConnection      
      }
      else {
        log -level "error" -msg "Connection to DB $dbName on host $hostName failed!"
        log -msg "Retrying to connect to DB $dbName on host $hostName..."
        return CreateDbConnection -uid $uid -password "$($password)" -dbName $dbName -hostName $hostName     
      }
    }
  }
  catch [System.Exception] {
    $_.Exception | Write-Output
    Log -level "error" -msg "error while connecting to DB $dbName on host $hostName." 
  }
} # CreateConnectionToDB



# How to use example
[string]$collectionsQuery = "select * from TABLE_NAME"
[string]$sccmDbHost = "*****"
[string]$sccmDbName = "*****"
[System.Data.SqlClient.SqlConnection]$sccmCon = CreateDbConnection -uid $SccmDbUserName -password $SccmDbPassword -dbName $sccmDbName -hostName $sccmDbHost
[System.Data.SqlClient.SqlCommand]$collectionsCmd = New-Object System.Data.SqlClient.SqlCommand

$collectionsCmd.CommandTimeout = 960
$collectionsCmd.Connection = $sccmCon
$collectionsCmd.CommandText = $collectionsQuery
[System.Data.SqlClient.SqlDataReader]$sccmDataReader = $collectionsCmd.ExecuteReader()

[System.Data.DataTable]$dataTable = New-Object System.Data.DataTable
$dataTable.Load($sccmDataReader)
$numRows = $dataTable.Rows.Count
log -level "success" -msg "$("{0:N0}" -f $numRows) rows downloaded." 