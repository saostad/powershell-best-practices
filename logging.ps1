[string]$logFileName = Get-Date -Format HH_mm_ss_fff
Write-Output "Writing logs to file $logFileName.txt"

Function Log {
  param(
    [Parameter(Mandatory = $true)][String]$msg
  )
  
  Add-Content "$logFileName.txt" $msg
  Write-Output $msg
}
