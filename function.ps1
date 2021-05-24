function parse-com{
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [string[]]$list
    )
    
    # Code here
}

# Cell like here:
parse-com -list "a", "b", "c"
