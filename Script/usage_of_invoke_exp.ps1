$cmd_fetch="Get-Process | Select -First 5 | Select-Object -Property ProcessName,Id,CPU,ws,pm"
# $cmd_fetch
Invoke-Expression $cmd_fetch