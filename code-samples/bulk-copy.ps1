[string]$CnnStrTarget = "Data Source=$($dst.dstHost);Initial Catalog=$($dst.dstDb);Integrated Security = False; TimeOut = 100000; User ID = $($dst.dstDbUser); Password = $($dst.dstDbPass)"

[System.Data.SqlClient.SqlBulkCopy]$SqlBulkCopy = New-Object -TypeName System.Data.SqlClient.SqlBulkCopy($CnnStrTarget, [System.Data.SqlClient.SqlBulkCopyOptions]::KeepIdentity)

$SqlBulkCopy.EnableStreaming = $true
$SqlBulkCopy.DestinationTableName = $dst.dstTblName
$SqlBulkCopy.BatchSize = 10000 # Another candidate for function parameter
$SqlBulkCopy.BulkCopyTimeout = 300 # seconds, 0 (zero) = no timeout limit

$SqlBulkCopy.WriteToServer($srcDataReader)
log -level "success"  -msg "bulk copy to $($dst.dstHost).$($dst.dstDb) finished!" 
$SqlBulkCopy.Close()  
