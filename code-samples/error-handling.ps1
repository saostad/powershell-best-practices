try {
  # code here
}
catch {
  $_.Exception | Write-Error
}
finally {
  # cleanup here
  # - delete temporary files
  # - close db connectons
}
