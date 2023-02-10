#### Reading and Validate and Write

##### Reading the Input From the User Via Console

- we can use the `Read-Host` cmdlet to read the input from the console 
- `Read-Host` cmdlet can be work to take the input such as password by masking it 
- the `Read Host` cmdlet can be used to take the input from the user without prompting anything to the console `by default`
- but we can use it to prompt message as well by using it as `[<String>]$<variable>=Read-Host "<what we want to prmpt>"`
- here in the above senario if not proper value proivided by the user then we will end up getting error
- by the above approach we can  make sure that user input been saved to a variable 


- we can use the flag as `-AsSecureString` to make sure that `user input data` will be masked as `password`
- when we use the `-AsSecureString` flag then the type of variable will become as `system.Security.SecureString`
- if we are `echoing the result` to the` output` then `SecureString`  will not be displayed by default

- single character can be consiodered as `CHAR`  in powershell

-  the default format of the `Date Time ` variable is of `[Date Time]`

#### How to Put Validation while Reading the Values 

#####  How to use the  ValidateSet

- By using the `ValidateSet` we can restrict the user to put the value mentioned in the ValidateSet not anything apart from that
- in order to define the ValidateSet we can use it as below `[ValidateSet(<value1>,<value2>)]` and so on
- we can provide a [validateset(<value1>,<value2>,<value3>)] $variable= Read-Host "string value for prompt"


##### How to use the ValidateLength

- `[validateLength(<lenght1>,<length2>)] `will be used in order to validate the `user input string is of certain length`
- here we have to use the `[ValidateLength(<length1><length>)]=[String] Read-Host "string to prompt"`

#### How to use the ValidateRange

- `[ValidateRange(<value1>,<value2>)] `will be usedto validate the user provided value reside inside the range or not if reside then allow else error our
- we can define that as `[ValidateRange(<length>,<length>)] $variable= [String] Read-Host "string what we want to prompt " `

- we can us e the `get-help about_function_advance_paramter -ShowWindow` will display all the valuidation available on a separated page


###### How to Write to the console on to the Output Screen

- here we can use the `Write-Host` command to Write the value to the console 
- we can alo use the flag as `-ForegroundColor` and `-BackgroundColor` to customizxe the output 
- we can write the output as below 
  -  `Write-Host "some str" -ForegroundColorcyan -BackgroundColor re`

- if we  want to display the info on the `foreground` then use it as `write-Host`
- if we want to display the info on the `console without pipe` then `write-host` is a great choice for the same 

- but if we want to use the process as `background or using the pipeline` then any of similar file we can write
  - Write-Output
  - Write-Error
  - Write-Warning
  - Write-Debug
  - Write-Verbose

- the `Write-Debug` and `Write-Verbose` can have flag `Debug and Verbose`
- `Write-Debug` and `Write-Verbose` if we want to show something to the console `by default this will not show any info `
- but if we use it wilh the `-debug or -verbose` flag then we can write that to the console 


#### Why we should not Write using the Write-Host comand 

- it will not send the `object in the pipeline`
  ex:-

    ```
        Write-Host "Hello" | Get-Member
        # this Get-Member show the information to the object such as which function and variables avaiolable for the object
        #but as we are using it with the Write-Host and `Write Host` does not pass object to the pipeline hrnce the "Hello" Never passed to the pipeline 
        #hence in this case we will be getting the error as Write-Host does not support that 
        Write-Output "Hello" | Get-Member  will send the object to the pipeline hence we will be able top see the info in this case
    ```

- we can't `store the output` of the `Write-Host` on to  a variable in this case
- but using the `Write-Output` we can store the info to the  variable 
  
  ```
        #saving the output to a variable
        [String]$<var1>=Write-Output "Hello There"
        [String]$<var2>=Write-Hello "Hello There"

        #to display the info in here
        $<var1>
        $<var2>

  ``` 