# Install-Module SimplySql -Scope CurrentUser
# Get-Command -Module SimplySql

Import-Module SimplySql

function Invoke-Mysql {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $true)]
    [String]$Query,
    [Parameter(Mandatory = $true)]
    [PSCredential]$Credential,
    [Parameter(Mandatory = $true)]
    [String]$Database,
    [Parameter(Mandatory = $true)]
    [String]$Server
  )
  
  $ConnectionName = "MySQL-Connection"
  Open-MySqlConnection -ConnectionName $ConnectionName -Credential $Credential -Server $Server -Database $Database
  $Result = Invoke-SqlQuery -Query $Query -ConnectionName $ConnectionName  
  Close-SqlConnection -ConnectionName $ConnectionName
  Return $Result
}



Export-ModuleMember -Function Invoke-Mysql
