[string]$FilePath = "C:\Path\"

# if not exist create it
if (-Not (Test-Path -PathType Container $FilePath)) {
    $LogFilePath = New-Item -ItemType Directory -Force -Path $LogFilePath
}
