Function Log {
    param(
        [Parameter(Mandatory=$true)][String]$msg
    )
    
    Add-Content log.txt $msg
    Write-Output $msg
}
