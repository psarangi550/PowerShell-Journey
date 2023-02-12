# we can sort the services as below 
# Write-Output $(Get-Service) | Sort-Object Status -Descending

#if we want to Get a Particular Service then we can use it as 
# Write-Output $(Get-Service -Name "Microsoft*")

#we can get the services whose name starts with `A` then we can do that using the `Where-Object` as below
# Write-Output $(Get-Service) | Where-Object {$_.Name -like "M*" -and $_.Status -ceq 'running' }
# #or
# Write-Output $(Get-Service -Name "M*") | Where-Object {$_.Status -ceq 'running'}

# we can Get-Few Services info by using the `Select-Object` as below 
# Write-Output $(Get-Service -Name "M*") | Where-Object {$_.Status -ceq 'running'} | Select-Object -First 2

# we can also make small chucjk out of the `big pipeline` by refactoring it with `|` symbol as below 
# in this case when powershell encounter the `|` symbol it assume the `command` will be on the same or next line hence we can break it onto the chunk like this 
# Write-Output $(Get-Service -Name "M*") | 
#     Where-Object {$_.Status -ceq 'running'} | 
#         Select-Object -First 2


# How to Start and Stop the Service by using it as below 
# we can puyt the `Stop-Service` to stop a service
# we can also put the  `Start-Service` to start a particular Service over here
#iun case of doubt we can use the `-WhatIf` flag into it as well

# Write-Output $(Get-Service -Name "*KiteService*") | Stop-Service

Write-Output $(Get-Service -Name "*KiteService*") | Start-Service

