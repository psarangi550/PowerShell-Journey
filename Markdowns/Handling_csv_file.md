#### Handle CSV_File Using Powershell ####

- `csv` stand for the `comma separated values` files 
- Here` we will see how to read the CSV file` and `Manipulate its value` and `write to a CSV file as well `
- we can import the CSV file using the `Import-csv` cmdlet as `Import-Csv <csv file location>`
- the `Import-Csv` cmdlet create a` table-like object` from the csv file where each `column` become its `property` and each row become the `corresponsing value `of the `property` 
- we can create the CSV file using the `Export-csv` cmdlet as `Export-CSV <csv file location>`
- we can fetch the `Property` of the `Table-Like object` by using the `$<variable that content the table object which return by Import csv cmdlet> | Get-Member`


    ```
        #describing the variable with file details 
        $var1="data.csv"
        #importing the data with the path here 
        $csv_data=Import-Csv -Path $var1
        #here the output data of the csv file we captured
        Write-Output $csv_data
    ```

- if we want to `sort the csv data` based on a particular column then we need to separate the `column data` from the `each row` in order to write it 
- as the `table object` which we got from the `Import-Csv` cmdlet also store the `column` as a property hence using that with the `Sort-Object` we can sort the `csv data`
- we can also use the `Select-Object` and `Where-Object` similarly how we used in the `Get-Service` and `Get-Process` cmdlet
- the `table object` that we got is an `Array Object` so all the property of the `Array` will be applied in here
- we can see that info as `$(<table object which is the return value of import-csv>).GetType()` we can see its of `Array Type` only

    ```
        # we can sort the csv data using  it as below 
        $var1="output.csv"
        try{
            if (Test-Path -Path $var1 -ErrorAction Stop -ErrorVariable var11){
                #here we need to read the content and sot the result
                $csv_content=Import-Csv -Path $var1 -ErrorAction stop -ErrorVariable var2
                Write-Output $csv_content | Sort-Object Mark | Select-Object -First 1 
            }
            else{
                Write-Error "Something Went Wrong  While Reading the Output $var2"

            }
        }catch{
                Write-Error "Somethign went Wrong $var11"
            }

    ```

- we can also `Get-Content` method to read the `CSV File` but will not be able to Take the `advantage of the CSV file format` as it will read it like a `Normal Text` file


##### How to Create Our Own CSV File ######

- we can `prepare` that we want to create by using the `Add-Content` cmdlet
- here need to provide the `path` of the CSV file `to which we want to add the content` by using the `-Path` cmdlet
- we can also use the `-Value` flag to `specify the columns`  which we want to add to the file
- if we want to `add` the `data to the CSV file` then we have to use the `Array` over here
- in order to iterate over it we need to `iterate over the array  and add that against the -Value flag` as below 
- here we need to use the `ForEach-Object` over the CSV file to iterate ove the values 

    ```
        #here we can see the output of the csv file from the start
        #here we need to provide the column name as it is and provide the `Quotes` on the overall format
        Add-Content -Path "output.csv" -Value 'Name,Subject,Mark'
        #here also we need to provide the data as the Array but each having the values only spearated by `single quotes`
        #here we need to add the Araay of data as below 
        $data_to_be_added=@(
            'pratik,math,75',
            'rika,english,90'
        )
        #adding the data to the csv file as below 
        #here we need to use the `ForEach-Object` which can iterate over the values mentioned in the data Array
        $data_to_be_added | ForEach-Object {Add-Content -Path "output.csv" -Value $_}

    ```


- By using the `Export-Csv` cmdlet we can create a CSV file out of the box
- but when the csv file is created that comes with some default info if we want to ignore it then we can use as `-NoTypeInformation` flag which ignore all the information


##### Pratical Problem Solving CSV File Using PowerShell #####

- if we have to sort the `data` in the `CSV-File` and Save that to a `New-CSV` using the `_sorted` append to its name then in order to do that we can do as below 

    ```
        
        $var1="output.csv"
        #here we are sorting and saving the new result top a new csv file over here 
        # Import-Csv -Path $var1  | Sort-Object Mark -Descending  | Export-CSV -Path "output_sorted.csv"
        # if we do this we will get the below info on the top as #TYPE System.Management.Automation.PSCustomObject
        #if we want to avoid that we can use the -NoTypeInformation over here 
        Import-Csv -Path $var1  | Sort-Object Mark -Descending  | Export-CSV -Path "output_sorted.csv" -NoTypeInformation

    ```

- if we want to sort all the `csv-data` in one folder and `Sort` its data and Save it to the `Another Folder` 

    ```
        $var1="output.csv","data.csv"
        #reading all the file and sorting the data saving to a different different folder 
        # $var1 | ForEach-Object Import-Csv -Path $_ | Sort-Object Mark -Descending
        $my_data=$var1 | ForEach-Object { Import-Csv -Path $_  } | Sort-Object Mark -Descending
        Write-Output $my_data
    ```

    ```
        $var1="output.csv","data.csv"
        #reading all the file and sorting the data saving to a different different folder 
        # $var1 | ForEach-Object Import-Csv -Path $_ | Sort-Object Mark -Descending
        $my_data=$var1 | ForEach-Object { Import-Csv -Path $_  } | Sort-Object Mark -Descending
        Write-Output $my_data | Export-Csv "new_out.csv" -NoTypeInformation
    ```

    ```
        # checking for every csv_file in the current directory  as below 
        Get-ChildItem -Filter "*.csv" | ForEach-Object {Import-Csv -Path $_} | Sort-Object Mark -Descending | Export-CSV -Path "new_csv_mod.csv" -NoTypeInformation
    ```