#### How to Use the If-Else Statement in Powershell Script

###### How to Use the `-and or -or and -not operator` in the Powershell Script

- we can combine multiple condition using the `-and` condition as  below 
- this `-and` operator will return True `if both the condition been matching` 

- same as the `-and` we can use the `-or` operator for `which if either of the consition value is True then return True` else return False

- we also have a `-not` operator `to validate that whether we are not getting the result` 
- the `-not` will make a condition as `False` as `True` if we are using the conditional expression

- we can use the `if-else` loop include another `if-else` loop as well 

- here we can check the condition as below with `if elseif and else` block 


#### Advance If-else Statements 

- we can `store` the value of `if else return value` to a particular variable as `$variable=if($true){1}else{2}`
- we can use those variables as `$variable ` in this case

```
    [int]$var1=Read-Host "Enter a Number"
    $result=if ($var1 -gt 10){Write-Host $var1}else{Write-Error "Number is not a valid number"}
    Write-Host $result
```


#### How to use the Switch Statements in Powershell script
- switch statement can be considered as the `series of if statement` or `series of elseif statements`
- using the `switch statement` we can verify the `variable or an expression against multiple condition`
- if none of the condition matching then `code` in the  `default` block will get executed

```
    [int]$var1=Read-Host "Provide an Integer Number"

    switch ($var1) {
        10 {
            Write-Host "Number is under 10 and 100 "
        }
        Default {
            Write-Host "Number Not under 10 and 100"
        }
}

```