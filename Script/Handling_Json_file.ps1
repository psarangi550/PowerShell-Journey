## checking the file is a valid Json or not using the `Test-Json` cmdlet as below
# here we need to use the `-raw` flag while using the `Get-Content` to fetch the file in its raw format 
# we need to run the command in the Powershell admin console
# Get-Content -Path ".\data.json" -Raw | Test-JSON
#here also we will get the Output of the Result in Boolean format as `True/False`


#here we are reading the JSOn Content Out in here as below
# $json_file=Get-Content -Path ".\data.json" | Out-String | ConvertFrom-Json
#writing the JSOn file after getting it Loaded
# Write-Output $json_file
# #fetching all the Key and value out in here as below 
# Write-Output $json_file.COMP_INFO
# Write-Output $json_file.COMP_INFO.Name
# Write-Output $json_file.COMP_INFO.machine_name


# $json_file | Select-Object Name


# $json_file=Get-Content -Path ".\data.json" | ConvertFrom-Json
# $info = "" | Select-Object COMP_INFO2.machine_data2
# $info.COMP_INFO2.machine_data2=@{"SERVICES_INSTALLED"="BITS,AAA,BBB" ; "CPU_THRESOLD_PERCENTAGE"=80}
# # Write-OutPut $json_file.COMP_INFO
# Write-Output $info.COMP_INFO2.machine_data2
# $json_file+=$info
# $json_file+=$info.COMP_INFO2
# $json_file+=$info.COMP_INFO2.machine_data2
# $info.COMP_INFO2.Name
# $info.COMP_INFO2.machine_data2
# Write-Output $total_json
# $total_json | ConvertTo-Json | Out-File -FilePath "data2.json"

# explorer.exe $path
# $var1=Read-Host -Prompt "Select the Path" 


#creating the JSOn Filer from the Scratch 
# $src_path=New-Object System.Windows.Forms.OpenFileDialog
# $dest_path=Read-Host "Enter the Destination Path"
# $json=@() #initializing JSOn with empty String 
# $item=""|Select-Object src_path,dest_path
# $item.src_path=$src_path
# $item.dest_path=$dest_path
# $json+=$item
# Write-Output $json | ConvertTo-Json | Out-File -FilePath "dynamic_path.json"


# function Select-FolderDialog
# {
#     param([string]$Description="Select Folder",[string]$RootFolder="Desktop")
#     [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
#    $objForm = New-Object System.Windows.Forms.FolderBrowserDialog
#         $objForm.Rootfolder = "../$RootFolder"
#         $objForm.Description = $Description
#         $Show = $objForm.ShowDialog()
#         If ($Show -eq "OK")
#         {
#             Return $objForm.SelectedPath
#         }
#         Else
#         {
#             Write-Error "Operation cancelled by user."
#         }
# }


# choosing the Source Path Over here

# $json_file_path="startwars.json"

# $all_json= Get-Content -Path $json_file_path | ConvertFrom-Json

# Write-Output $all_json.results

#here we are converting the CSV File into a JSon File using Powershell

# $csv_path="new_csv_mod.csv"

# $load_csv=Import-Csv -Path $csv_path -Delimiter ","

# $csv_val= $load_csv | Format-List -Property Name,Subject,Mark

# $csv_val | ConvertTo-Json | Out-File "output_new_emp1.json"


### How to Use in API Docs

$url="https://pokeapi.co/api/v2/pokemon/ditto"

#to access the web application as below

# $result=Invoke-WebRequest -Uri $url

# Write-Host $result.StatusCode

# $result.Content | ConvertFrom-Json
# $result.Content | ConvertFrom-Json | Where-Object {$_.name -eq "ditto"}


# instead of using the `Invoke-WebRequest` we can also use the `$Invoke-RestMethod`

$result=Invoke-RestMethod -Method Get -Uri $url

# Write-Output $result

$result | Where-Object {$_.name -eq "ditto"}