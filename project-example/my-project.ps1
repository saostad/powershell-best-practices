# Explain what's the goal fof this script
# Author Name: ****
# Copyright License: ****
# Create Date: ****


# this line force powershell to stop if any line error happen
$ErrorActionPreference = "Stop"

Function mainFunction {

  try {
    [string]$logDirectory = Join-Path -Path $PSScriptRoot -ChildPath "logs"
    [string]$logFileName = Get-Date -Format yyyy_MM_HH_mm_ss_fff
    [string]$logFileFullPath = Join-Path $logDirectory -ChildPath "$logFileName.log"
  
    # if logs directory not exist create it
    if (-Not (Test-Path -PathType Container $logDirectory)) {
      New-Item -ItemType Directory -Force -Path $logDirectory
    }
  
    Write-Output "Writing logs to file $logFileFullPath"
  
    Function Log {
      param(
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][String]$msg,
        [Parameter(Mandatory = $false)][String]$level,
        [Parameter(Mandatory = $false)][System.ConsoleColor]$ForegroundColor,
        [Parameter(Mandatory = $false)][System.ConsoleColor]$BackgroundColor
      )
    
      $time = Get-Date -Format HH:mm:ss.fff
      Add-Content "$logFileFullPath" "$time $msg"
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

    # put your code below here
    Log -msg "hi"
  }
  catch {
    # error handling code here
    Log -msg $_.Exception
    $_.Exception | Write-Output
  }
  finally {
    # clean up here 
    # - close db connection
    # - delete temporary files
  }

} #Function mainFunction

$executionTime = Measure-Command -Expression {
  mainFunction
}
Log -msg "Execution Time: $executionTime"