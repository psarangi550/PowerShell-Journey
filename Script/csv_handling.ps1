#describing the variable with file details 
# $var1="data.csv"
# #importing the data with the path here 
# $csv_data=Import-Csv -Path $var1
# #here the output data of the csv file we captured
# Write-Output $csv_data


#here we can see the output of the csv file from the start
#here we need to provide the column name as it is and provide the `Quotes` on the overall format
# Add-Content -Path "output.csv" -Value 'Name,Subject,Mark'
# #here also we need to provide the data as the Array but each having the values only spearated by `single quotes`
# #here we need to add the Araay of data as below 
# $data_to_be_added=@(
#     'pratik,math,75',
#     'rika,english,90'
# )
# #adding the data to the csv file as below 
# #here we need to use the `ForEach-Object` which can iterate over the values mentioned in the data Array
# $data_to_be_added | ForEach-Object {Add-Content -Path "output.csv" -Value $_}



# we can sort the csv data using  it as below 
# $var1="output.csv"
# try{
#     if (Test-Path -Path $var1 -ErrorAction Stop -ErrorVariable var11){
#         #here we need to read the content and sot the result
#         $csv_content=Import-Csv -Path $var1 -ErrorAction stop -ErrorVariable var2
#         Write-Output $csv_content | Sort-Object Mark | Select-Object -First 1 
#     }
#     else{
#         Write-Error "Something Went Wrong  While Reading the Output $var2"

#     }
# }catch{
#         Write-Error "Somethign went Wrong $var11"
#     }


# $var1="output.csv"
#here we are sorting and saving the new result top a new csv file over here 
# Import-Csv -Path $var1  | Sort-Object Mark -Descending  | Export-CSV -Path "output_sorted.csv"
# if we do this we will get the below info on the top as #TYPE System.Management.Automation.PSCustomObject
#if we want to avoid that we can use the -NoTypeInformation over here 
# Import-Csv -Path $var1  | Sort-Object Mark -Descending  | Export-CSV -Path "output_sorted.csv" -NoTypeInformation


# $var1="output.csv","data.csv"
# #reading all the file and sorting the data saving to a different different folder 
# # $var1 | ForEach-Object Import-Csv -Path $_ | Sort-Object Mark -Descending
# $my_data=$var1 | ForEach-Object { Import-Csv -Path $_  } | Sort-Object Mark -Descending
# Write-Output $my_data | Export-Csv "new_out.csv" -NoTypeInformation


# checking for every csv_file in the current directory  as below 
# Get-ChildItem -Filter "*.csv" | ForEach-Object {Import-Csv -Path $_} | Sort-Object Mark -Descending | Export-CSV -Path "new_csv_mod.csv" -NoTypeInformation
