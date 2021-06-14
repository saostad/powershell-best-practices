try {
  # code here
}
catch {
  $_.Exception | Write-Output
}
finally {
  # cleanup here
  # - delete temporary files
  # - close db connectons
}
