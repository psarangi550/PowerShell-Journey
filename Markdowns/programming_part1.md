#### <ins> Programing Building BBlock  for Powershell </ins>

##### <ins> Variables in Powershell


- variable-name we gave a computer memory location which store values
- Powershell uses `variable` as` temporary named storage `
- as powershell is object based hence variables also considered as object in  powershell
- `variable`  is a placeholder which will be used to store the values inside of them 
- variable can be created in `powershell` by putting `$` symbol above it 
- we can declare the variable as given below 

    ```
        #declaring the variables out in here
        $var1="Hello There"
        #writing the scripts to the console 
        Write-Output $var1

    ```

- if we want declare a variable as global then we need to  declare the variable as `$<global>:<variable-name>=<value>`
- if we have a global variable then we can access that inside a function 
- by default the variable that we clare with only `$<var name>` are the local variables 

-  we can access the `global variable` after the `script executed`  in the `terminal` then we can get the `global variable` but thats not possible in case of the `local variable`
-  we can use the `cmdlet` as `Global-Variable` in order to get the `global variable`, after the sceript executed all the `global variable decalred in the script will be available after executed ` in the terminal we can fwetch that 
-  when we use the  `global variable` that been `store to the shell`  where we are executing the script `not to other shell`


- we can use the below syntax to create the variableas as well   
  - Set-Variable::-`it will check for the existing variable with the same name if found then it will change the value of that variable`
  - New-Variable:- `but new variable always create the new variable without checking for the existing variables `

  - we can use the `Set-Variable`as `Set-Variable -Name <name of the variable> -Value "<value of the variable></value>"`
  - we can use the `New-Variable`as `New-Variable -Name <name of the variable> -Value "<value of the variable></value>"`

- by using the `Set-Variable` we can make sure that `we are not waisting any variables rather than that we are re-using them`

- if are  declaring the variables then  we can access those variable as `$` symbol
- while declaring and accessing we can use the `$` symbol to get the value of the variable


- the `cmdlet` `Global Variable` will able to show the `global variables our script has after being executed ` and `some default one which been provided for the powershell`
- in other word we can say that `Get-Variable` command will display all the variables present in the current shell (if we executed our script then out global variable alsop be a part of it) 



- we can search for a particular variable as `Global-Variable "<intial letters  of the global variables>*"`
- our preferences also store as `variables` in every shell as `global variable `
- - we can access the `preferences` as `Global-Variable "*pref"`
- but we can't see the `local variable` in the script for the same 


- the `Remove-Variable` cmdlet will help in purge the `variable name as werll as variable value`
- if we have  the scope derfined for the variable such as `$global:<variable name>` then `Remove-Variable` will `rmeove that specific variable on the particular scope` 
- but we can use the `Remove-Variable` to remove the `variables in the current shell which been defined by the powershell in the current shell`
- the syntaxx for the `Remove-Variable` cmdlet is `Remove-Variable -Name <name of the variable which we wwant to remove> `


    ```
        # remove variable in case of here 
        $Global:var2="Hello World"
        Write-Host $var2
        Remove-Variable -Name var2
        Write-Host $var2

    ```

- if we want ot see the type for a  variable then that can be done by `$<variable name>.gettype()` which can be of below value
  - System.String
  - System.Int32
- if the `variable value is Null i.e after deleted from ther current scope` for the shell then when we do `.gettype` then we will `end up getting an error `for the same  
    
   

- the `Clear-Variable` cmdlet is `Clear-Variable -Name <name of variable>` will be used to `remove the variables value`  and` make thge variable as null` but `does not delete the variable`

     ```
        # using the Clear-Variable Option Out in here 
        $var3="Hello World"
        Write-Output $var3
        Clear-Variable -Name var3
        #here i am expecting the null value 
        Write-Output $var3
        
    ```


- by default powershell follow a  `convention to define the variable` by t we can override the same as `${<variable name with symbol>}=<value>`
- but this approach is not recomended

- we can also make a variable as constant as below 
  - `Set-Variable -Name <name of the variable> -option ReadOnly/constant <value>` which make itas an constant and if wer are trying to change its value then we will end up getting an error for the same 
  - now if we try to assign a new value as `$<variable name>=<new value>` we will end up getting the error for the same 
  - setting the constant variable as below `Set-Variable -Name <variable name> -option ReadOnly/constant <value>` 
