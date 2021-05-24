[string]$logFileName = Get-Date -Format yyyy_MM_HH_mm_ss_fff
Write-Output "Writing logs to file $logFileName.log"

Function Log {
  param(
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][String]$msg,
    [Parameter(Mandatory = $false)][String]$level,
    [Parameter(Mandatory = $false)][System.ConsoleColor]$ForegroundColor,
    [Parameter(Mandatory = $false)][System.ConsoleColor]$BackgroundColor
  )
  
  $time = Get-Date -Format HH:mm:ss.fff
  Add-Content "logs\\$logFileName.log" "$time $msg"
  if ($ForegroundColor -and $BackgroundColor) {
    Write-Host "$time $msg" -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor
  }
  elseif ($ForegroundColor) {
    Write-Host "$time $msg" -ForegroundColor $ForegroundColor
  }
  elseif ($BackgroundColor) {
    Write-Host "$time $msg" -BackgroundColor $BackgroundColor
  }
  elseif ($level.ToLower() -eq "warn") {
    Write-Warning "$time $msg" 
  }
  elseif ($level.ToLower() -eq "error") {
    Write-Error "$time $msg" 
  }
  elseif ($level.ToLower() -eq "success") {
    Write-Host "$time $msg" -ForegroundColor White -BackgroundColor DarkBlue
  }
  elseif ($level.ToLower() -eq "progress") {
    Write-Host "$time $msg" -ForegroundColor White -BackgroundColor DarkGray
  }
  else {
    Write-Host "$time $msg"
  }
}
