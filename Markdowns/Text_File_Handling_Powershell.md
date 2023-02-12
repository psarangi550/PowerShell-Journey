#### How to Handle Text Files In Powershell ####

- we need to `Ensure that the file exist on the location before performing any action on it `
- By using the cmdlet `Test-Path "<files or directory to check>"` we can make sure that the file exists on the location
- This `Test-Path` cmdlet return `True/False` depending on the file being `present or not present`
- we can use the `Write-Verbose with -Verbose ` flag or `Write-Debug` with `-Debug` flag to ensure when run only if we peovide the `-Verbose/-Debug` flag to it

    ```
        # checkign File_exists Or not  by using the `Test-Path`
        if (Test-Path -Path "log.txt"){
            Write-Output "File exists"
        }else{
            Write-Error "File Does not exists"
        }
    ```

- we can use that with the `-ErrorAction` flag as below 

    ```
        $file_path="log.txt"
        try{
            if (Test-Path -Path $file_path -ErrorAction Stop -ErrorVariable var1){
                Write-Output "File exists"
            }
            else{
                Write-Error "File does not exists"
            }
        }catch{
            Write-Output "Something went Wrong and please check $var1"
        }

    ```


- if we want to fetch the `File-Content` then we can use the cmdlet `Get-Content "<location of the files>" `
- or hwere we can save the `file-path` to variable and access that using the `Get-Content $<variable where we store the file_path>`
- we can savr the conent of a file into a `Poershell Variable` as well
- if we want first or last few line we can mention the `-Tail <number of line>` with the  `Get-Content "<location of the files>" ` command as `Get-Content "<location of the files>" -Tail <no of line> `

    ```
        # reading the content of a file 
        $var1="write_file.txt"
        if (Test-Path $var1 -ErrorAction Stop -ErrorVariable var2){
            $all_content= Get-Content -Path $var1
            Write-Output $all_content #printing the Output to the console
        }else{
            Write-Error "SomethignWent Wrong "
        }

    ```
- we can also use the `-ErrorAction <action item> -ErrorVariable <variable name only>` here to Handle the Error 
- if we want to  Handle the Error then we can use the `ErrorAction stop` to catch the `Error` in this case

    ```
        #here we can use the Try/catch block in here as well with the -Tail Option 
        #reading the file only the last few Lines and using the Try-cvatch block to get it Graceful Termination
        $var1="write_file.txt"
        try{
        if (Test-Path $var1 -ErrorAction Stop -ErrorVariable var2){
            $all_content= Get-Content -Path $var1 -Tail 2 -ErrorAction Stop -ErrorVariable var3
            Write-Output $all_content #printing the Output to the console
        }else{
            Write-Error "Something Went Wrong "
        }
        }catch [System.IO.FileNotFoundException]{
            Write-Error "Something went Wrong $var2"
        }
        catch{
            Write-Error "Something went Wrong $var3"
        }

    ```


- if we want to read the `Specific Line` By the `Line number` then we can use the `index` of the` variable to which we store the file-content` by using the `Get-Content "<location of the files>" `
- if we want the `range of line` then we can get that by using the `[<index1>..<index2>]` of the ` variable to which we store the file-content` by using the `Get-Content "<location of the files>" ` and store it inside the `another variable` and `Write to it`


- if we want to fetdch by the lines by condition then we can use as ` variable to which we store the file-content` by using the `Get-Content "<location of the files>" ` and use it with the `Where-Object` in there and we can use the `Pipeline` concept out in here and Put the `$_` represent the current object which is bnothing but the `varaibel to which we store the content of the file ` 

    ```
        #using the Where-Object to fetch a specific line
        # reading tjhe lines based on condition using the `Where-Object`
        $var1="write_file.txt"
        try{
        if (Test-Path $var1 -ErrorAction Stop -ErrorVariable var2){
            $all_content= Get-Content -Path $var1 -Tail 2 -ErrorAction Stop -ErrorVariable var3 | Where-Object {$_ -like "* 5 *"}
            Write-Output $all_content #printing the Output to the console
        }else{
            Write-Error "Something Went Wrong "
        }
        }catch [System.IO.FileNotFoundException]{
            Write-Error "Something went Wrong $var2"
        }
        catch{
            Write-Error "Something went Wrong $var3"
        }

    ```

- we can also use the `Select-String` cmdlet to` search for a pattern or String` `inside the File-Content`
- we can also provide the pattern we want to seach using the `-Pattern` flag to the `Select-String` cmdlet
- -we can also provide the `CaseSensitive` flag if we want to search for `pattern` with a `Strict value`
- we can also use it with the `Pipeline` or we can use it by `providing the filepath` in the `-Path` flag of the `Pipeline` 
- the `Select-String` can be used as the `grep` command  in the `unix environment` which is similar to the `FindStr` cmdlet  in the `Windows Bat file`
- by using the `Select-String` we can fetch the `Logs` as well in this case


    ```
        $var1="write_file.txt"
        Select-String -Path $var1 -Pattern "."
        #here using the `.` symbol to select everything 
        $var1="write_file.txt"
        Select-String -Path $var1 -Pattern "Number 5"
        $var1="write_file.txt"
        Select-String -Path $var1 -Pattern "1$" -CaseSensitive
    ```


- we can use the `Select-String` cmdlet to fetch a pattern in `multiple files` as well 
- we cna use it as `Select-String -Path "*.xml" -Pattern "<pattern we want to search>"` which will search the pattern in all the xml file present 
- we can see the Help Page for the same as using it `Get-Help Select-String -ShowWindow`
    
    ```
        Select-String -Path "*.txt" -Pattern "1$" -CaseSensitive
        #this will read from all the `.txt` file and provide an approprioate answer
    ```


#####  How to Write the content to a File using Poershell

- To Write Anything to a file  we can use the cmdlet `Out-File` with the flag as `-FilePath` which takes the `file_path` as the args
- we can also use the option sucjh as `-Append/-Force/-Encoding` while using the `Out-File` cmdlet as well
- we can sorround the command as `$(<command>)` to write to a file 

    ```
        ### Writing to A file in here
        # here we can perform math operation by putting themn in `$()` symbol out in here 
        # $var1=1
        # Write-Output "$(Get-Date) : This is Line $var1"  | Out-File -FilePath "write_file.txt"
        # Write-Output "$(Get-Date) : This is Line Number $($var1+1) " | Out-File -FilePath "write_file.txt" -Append
        # Write-Output "$(Get-Date) : This is Line Number $($var1+2) " | Out-File -FilePath "write_file.txt" -Append
        # Write-Output "$(Get-Date) : This is Line Number $($var1+3) " | Out-File -FilePath "write_file.txt" -Append
        # Write-Output "$(Get-Date) : This is Line Number $($var1+4) " | Out-File -FilePath "write_file.txt" -Append
        # Write-Output "$(Get-Date) : This is Line Number $($var1+5) " | Out-File -FilePath "write_file.txt" -Append
    ```