# checkign File_exists Or not  by using the `Test-Path`

# if (Test-Path -Path "log.txt"){
#     Write-Output "File exists"
# }else{
#     Write-Error "File Does not exists"
# }

# using it with the `-ErrorAction` flahg with `-ErrorValue` flag inside the `Try-Catch` block as below 

# $file_path="log.txt"
# try{
#     if (Test-Path -Path $file_path -ErrorAction Stop -ErrorVariable var1){
#         Write-Output "File exists"
#     }
#     else{
#         Write-Error "File does not exists"
#     }
# }catch{
#     Write-Output "Something went Wrong and please check $var1"
# }


### Writing to A file in here
# here we can perform math operation by putting themn in `$()` symbol out in here 
# $var1=1
# Write-Output "$(Get-Date) : This is Line $var1"  | Out-File -FilePath "write_file.txt"
# Write-Output "$(Get-Date) : This is Line Number $($var1+1) " | Out-File -FilePath "write_file.txt" -Append
# Write-Output "$(Get-Date) : This is Line Number $($var1+2) " | Out-File -FilePath "write_file.txt" -Append
# Write-Output "$(Get-Date) : This is Line Number $($var1+3) " | Out-File -FilePath "write_file.txt" -Append
# Write-Output "$(Get-Date) : This is Line Number $($var1+4) " | Out-File -FilePath "write_file.txt" -Append
# Write-Output "$(Get-Date) : This is Line Number $($var1+5) " | Out-File -FilePath "write_file.txt" -Append


# reading the content of a file 
# $var1="write_file.txt"
# if (Test-Path $var1 -ErrorAction Stop -ErrorVariable var2){
#     $all_content= Get-Content -Path $var1
#     Write-Output $all_content #printing the Output to the console
# }else{
#     Write-Error "SomethignWent Wrong "
# }


#reading the file only the last few Lines and using the Try-cvatch block to get it Graceful Termination
# $var1="write_file.txt"
# try{
# if (Test-Path $var1 -ErrorAction Stop -ErrorVariable var2){
#     $all_content= Get-Content -Path $var1 -Tail 2 -ErrorAction Stop -ErrorVariable var3
#     Write-Output $all_content #printing the Output to the console
# }else{
#     Write-Error "Something Went Wrong "
# }
# }catch [System.IO.FileNotFoundException]{
#     Write-Error "Something went Wrong $var2"
# }
# catch{
#     Write-Error "Something went Wrong $var3"
# }


# reading tjhe lines based on condition using the `Where-Object`
# $var1="write_file.txt"
# try{
# if (Test-Path $var1 -ErrorAction Stop -ErrorVariable var2){
#     $all_content= Get-Content -Path $var1 -Tail 2 -ErrorAction Stop -ErrorVariable var3 | Where-Object {$_ -like "* 5 *"}
#     Write-Output $all_content #printing the Output to the console
# }else{
#     Write-Error "Something Went Wrong "
# }
# }catch [System.IO.FileNotFoundException]{
#     Write-Error "Something went Wrong $var2"
# }
# catch{
#     Write-Error "Something went Wrong $var3"
# }


#usage of Select-String with a pattern what we want to choose
# $var1="write_file.txt"
# try{
# if (Test-Path $var1 -ErrorAction Stop -ErrorVariable var2){
#     $all_content= Get-Content -Path $var1 -Tail 2 -ErrorAction Stop -ErrorVariable var3 | Select-String -Pattern "*5$"
#     Write-Output $all_content #printing the Output to the console
# }else{
#     Write-Error "Something Went Wrong "
# }
# }catch [System.IO.FileNotFoundException]{
#     Write-Error "Something went Wrong $var2"
# }
# catch{
#     Write-Error "Something went Wrong $var3"
# }



# we can use the Select-String with the `-Path` and `-Pattern` flag as below 
# $var1="write_file.txt"
Select-String -Path "*.txt" -Pattern "1$" -CaseSensitive