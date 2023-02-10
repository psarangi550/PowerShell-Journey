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



#### How to use the Switch Statements in Powershell script
- switch statement can be considered as the `series of if statement`
- using the `switch statement` we can verify the `variable or an expression against multiple condition`
- if none of the condition matching then `code` in the  `default` block will get executed
