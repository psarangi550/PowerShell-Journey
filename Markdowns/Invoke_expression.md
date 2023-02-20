#### How To Use `Invoke Expression` in Powershell ####

- The `Invoke Expression` cmdlet takes the `Expression as String` as the `command` and try to `Execute` the expression
- If we are putting a `cmdlet in the form of string` then `Powershell By default will not execute the expression `
- The example for the same being given as  below 

    ```
        $cmd_fetch="Get-Process | Select -First 5 | Select-Object -Property ProcessName,Id,CPU,ws,pm"
        #By default Powershell Treat the Process as the Normal String  will not execute the `cmdlet` if it contains any 
        # $cmd_fetch
        #the Invoke-Expression command Treat the String as the Powershell command and try to exexute the same as well 
        Invoke-Expression $cmd_fetch
    ```

- this can be used to get the `Script` from the internet as string and use it as an expression by using the `Invoke-Expression $<collection which return by the Invoke-WebRequest>.Content`
- this is highly unsafe hence recommended not to perform such activity