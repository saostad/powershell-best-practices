# Explain what's the goal fof this script
# Author Name: ****
# Create Date: ****
# Modified By: ****
# Modified Date: ****


# this line force powershell to stop if any line error happen
$ErrorActionPreference = "Stop"

try {
  # put your code here
}
catch {
  # error handling code here
  $_.Exception | Write-Output
}
finally {
  # clean up here 
  # - close db connection
  # - delete temporary files
}
