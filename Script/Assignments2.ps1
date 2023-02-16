#deleting folder which are older than 10 days 

# Get-ChildItem -Path "C:\Users\psara\Downloads\powershell_sprint_must\Section3" | ForEach-Object {
#     Write-Host $_.FullName
# }

#removing a particular item from the directory 
# Get-ChildItem -Path "C:\Users\psara\Downloads\powershell_sprint_must\Section3" | ForEach-Object {
#         if ($_.BaseName -eq "output"){
#             Remove-Item $_.FullName
#             Write-Output "Removal Done"
#         }
# }
# creating the Html Report of the Processes 
# Write-Output $(Get-Process) | ConvertTo-Html -Property Name,Id,CPU -CssUri "output.css" | Out-File "index.html"


#here i am able to see the output in the formated approach 
#converting table format to List format in powershell
# Get-Process | Format-List -Property Name,Id,CPU
#showing the info in the form of table as in
# Get-Process | Format-Table -Property Name,Id,CPU