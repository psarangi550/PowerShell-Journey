[int]$var1=Read-Host "Provide an Integer Number"

switch ($var1) {
    10 {
        Write-Host "Number is under 10 and 100 "
      }
    Default {
        Write-Host "Number Not under 10 and 100"
    }
}