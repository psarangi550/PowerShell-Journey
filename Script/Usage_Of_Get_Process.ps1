#how to use the `Get Process` cmdlet in Poershell
# Write-Output  $(Get-Process)

# we can also sort the Process by Process Id using the -Sort-Object as 
# Write-Output $(Get-Process) | Sort-Object cpu
#here we need to provide the `Sort object with wehich we can sort the process and also we can pass the column with which we want to sort`
#here we are sorting by the `CPU` utilization if we want to sort by PID then we can write as 
# Write-Output $(GET-Process) | Sort-Object Id
#here the id represent the PID of the process 

# we can see the process  return Type by using the `GetType()`
# Write-Output $((Get-Process).GetType())
#which is an obnject type data  System.Array type object 
# as we are getting the process-obj as the return value which will be passed to the pipeline
#here we can also use the `GetType()` cmdlet to see  what is the returned type of the `Get-Process` cmdlet

# we can use the `Select-Object -Fast 5` or `Select-Object -Last 10` ro show the 1st 5 processes and the last 10 processes out there
# Write-Output $(GET-Process) | Sort-Object Id | Select-Object -First 5
#here we are using the `Sort-Object and with the Column name also  mentioning the -Descending to sort descendingly`
#here we are using the `Select-Object -First/Last 10` to show a chunk of info out in here 


# top 10 process  that taking the Maximum CPU can be done by using it as bnelow 
# Write-Output $(Get-Process) | Sort-Object cpu -Descending | Select-Object -First 10  


# we can see the Process help by using the `Get-Help` command as below 
#Get-Help Get-Process -ShowWindow


# we can fetch the `Process-ID` of ther Process which been runningthis Powershell as 
# Write-Output $(Get-Process -Name  "*powershell*")

# we can get all the info column about the process by piping that into a `select *`
# Write-Output $(Get-Process -Name "*_ise")
# Write-Output $(Get-Process -Name "*_ise") | Select-Object *

# we can see the process where the CPU utilization is higher than  1000 Seconds
# here as we have to condition over here hence we need to use the `Where-Object` cmdlet with the `Curly Braces`
# Write-Output $(Get-Process) |Where-Object {$_.CPU -gt 1000}


# we can redirect the Putput to a file by using the `Out-File` cmdlet object as 
# Write-Output $(Get-Process) | Where-Object {$_.CPU -gt 1000} | Out-File log.txt

#how to kill a process using the `Get-Process` cmdlet by using it as  `Stop-Process`

# Write-Output $(Get-Process -Name "*_ise") | Stop-Process


# if we want to know what the Process-been doing then we can use the `-WhatIf` against the command 
# whatIf will not allow the `Powershell` to perform any action on top of it 
# it will only say what it intend to do
# Write-Output $(Get-Process -Name "*_ise") | Stop-Process -WhatIf




# Write-Output $(Get-Process  -Id 9508)
# Write-Output $((Get-Process).GetType())

#fetching all the process id by sorting it 
#HERE WHILE USING THE sORT-oBJECT WE JUST NEED THE COLUMN NAME WITH WHICH WE CAN SORT 
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5