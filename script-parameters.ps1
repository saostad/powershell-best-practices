# code sample of how to use parameters for script or function
[CmdletBinding()]
param (
  [Parameter(Mandatory = $true, ValueFromPipeline = $true)][string]$param1,
  [Parameter(Mandatory = $true, ValueFromPipeline = $true)][string]$param2,
  [Parameter(Mandatory = $true, ValueFromPipeline = $true)][string]$param3,
  [Parameter(Mandatory = $false)][string]$param4 = "~*",
  [Parameter(Mandatory = $false)][string]$param5 = '',
  [Parameter(Mandatory = $false)][bool]$param6 = $true,
  [Parameter(Mandatory = $false)][string]$param7 = "dbo.[PanzuraHomeDriveFiles]"
)