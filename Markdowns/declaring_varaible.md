#### <ins>Data Type and Type Casting in PowerShell 

- Data Type ois the `Type of value` we are `storing inside the variables`
- we don't have to define the type of the variables  while declaring the variable hence it will fetch the type of variable by default
- we can use the `Get-Type()` on the variable to know its type in here
- we can define that as `$<variable>.Get-Type()` which will provide the type of the variable
- we can also declare the boolean value as in here as `$<variable name>=$truw/$false`
- we can store the value as `Double` inside the `Powershell`

- Like Shell Script when we defione a variable then we can expand it using the `""` symbol but we can't do that using the `''` single quote
- if have `double quotes` still `don't want to expand the variables` then  we can use the ` "`<$variable>`" ` symbol on them as 
  
  
  ```
    $var1="Hello There"
    #here in this case it will expand the result
    Write-Host "$var1 Good Morning...."
    #but if we want not to expand the result then we can use as 
    Write-Host " `$var1 Good Morning"
    
  ```

### Properties of the String Variables 

- Length &rarr; `will provide the lenght of the string` and we can use as `$variable.Length`
- Contains() &rarr; `will provide whether the text present in the value of the variable we are testing for ` and we can use it as `$<variable name>.Contains("string")`
- IndexOf() &rarr; `will provide the index of the String that we have provided inside of that and return -1 if the Index not found ` and we can see that as `$<variable name>.IndexIf("string")`
- replace() &rarr; `will replace the old value with the new value` if we use as `$<variable>.replace("<old str>","<new str>")`
- Trim() &rarr; `will trim the String variable provided` and we can use it as `$<variable name>.Trim()`
- ToUpper() &rarr; `will  make the string as upper case` which can be used as `$variable.ToUpper()`
- ToLower() &rarr; `will make the string value in the variable lowercase` which can be used as `$variable.ToLower()`


- we can use the `multiline string literal` as `@""`/`@''`
  - in case of this `@""` the `variable will  be expanded`
  - in case of this `@''` the `variable will  not be expanded`
- while` using the multiline string literal` `we will not lose the formatting`


- by using the `-is` operator we can validate the string in this case as below 
  - `$variable -is [<data type>] ` we can validate the result which can come as `True/False`

- we can get all the `list of method and variable` for the variable based on the value assigned to it by using the `Get-Member` attribute as an `|` pipe
- we can use it as below `$var|Get-Member` will provide all the List of Method and Variable available for the user


#### How to Use typecasting in case of the Powershell 

- There are 2 ways to Type Cast a Variable in here 
  -  by `defining the type of the variable while declaring` so that particular variable be used for taking a particular type of value we can't provide any value to it
  -  once we deined like thisd then the `variable can store only one type of data in here`
  -  `if we are trying to assign a new value then in that case we will get an error`
  -  we can also validate the variable will be of a particular type or not using this 
    
    ```
        $date="2/10/2023" #here declaring the variables
        #here we are defining that the variable should be of DateTime type over here 
        [DateTime]$date=$date
        #here can see the type been used in here as below 
        $date.Get-Type() #this will provide the type of data we are storing

    ```
  -  we can also declare the variable as `$variable=[<Datat Type>]Value`
  -  but in this case the variable can be reused to store another type of data in the script 
