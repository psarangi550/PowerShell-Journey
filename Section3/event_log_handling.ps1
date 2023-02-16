## accessing the event Logs
# Write-Output $(Get-EventLog -List)


# accessing a specific event Logs for the "Application" as below 
# Write-Output $(Get-EventLog -LogName "Application") | Select-Object -First 10


#we can see the newest Log by using it as `-Newest` Flag with Number top see those New Logs
# Write-Output $(Get-EventLog -Newest 5 -LogName "Application" )

# we can also store the info to a Log By using it as below
# $event_log=Get-EventLog -LogName "Application" -Newest 5
# #here $event is an array and we can loop over it by using it as 
# $event_log | ForEach-Object {
#     Write-Output $_.source #here the $_.sopurce provide the params which will show the name of the Logs Over here
# }

# we can also apply Group-object as well as Sort the Object as well by using it as below
# $event_log=Get-EventLog -LogName "Application"  -Newest 5 | Group-Object -Property source | Sort-Object -Property count -Descending
# # here we are creating the variables  which will group by the `Source` column and Sort by the coubnt in descending order
# Write-Output $event_log


# if we want to fetch a Particular Type of Event based on their status whether `Error/Information/Success/Failure/Warning` then we can use it as with `-EntryType` flag
# Write-Output $(Get-EventLog -LogName "Application" -EntryType "Error" -Newest 5 | Select-Object -First 5  )




# we can use the `-Source` flag to get the info about the particular Event as below 
# Write-Output $(Microsoft.PowerShell.Management\Get-EventLog -LogName "Application" -Source "VSS" | Select-Object -First 5 )



# we can also use the Where-Object to filter it by the Event id for the Same 
# Write-Output $(Microsoft.PowerShell.Management\Get-EventLog -LogName "Application" -Source "VSS" | Select-Object -First 5 | Where-Object {$_.eventID -eq 8224} )



# if we want to know what are the event occured in Last One Hour then we can use the `-Before` and `-After` flag as below
# $currentTime=$(Get-Date)
# $preveiousTime=$currentTime.AddHours(-1)
# #now er can check the Logs using the `-Before` and `-After` flag
# Write-Output $(Get-EventLog -LogName "Application" -Before $preveiousTime -After $currentTime)

# same Like AddHours() we can we can use the AddDays() or AddMinutes() on the `Get-Date` flag as below to see the info


# we can Store the Logs in the Format of Html or css and Sendit in email then wee can use the Below command
#here we need to Pipe the Result into the ConvertToHtml flag in here as below
# here we can also mention the Property which we want to Transfer to Html by using the CovertTo-Html 

# Get-EventLog -LogName "Application" -Source "VSS" -EntryType "Error" | 
#     ConvertTo-Html -Property eventID,Source,Message -CssUri "output_decor.css" | 
#         Out-File "index_log.html"



#  if we want to read from multiple computer then we can use the `ComputerName` parameter  for the Same
# by default the for the `local` one the `computer name` is of the `hostname`

# Write-Output $(Get-EventLog -LogName "Application" -EntryType "Error"  -ComputerName PratikPC | Select-Object -First 5)


# we can also use the `Wmi Object to read the Event Log  which can be done as below `
