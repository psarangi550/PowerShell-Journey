#### Error Handling in PowerShell Script ####

- The Error can occur anytime while running the powershell script  because of below reason
- There are  few example which been given out in here ,but error can happend for any other reason as well
<table>
   <thead>
      <tr>
         <th>Task</th>
         <th>Uncertainity</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Reading /Writing File content</td>
         <td>file got deleted,Network Dependency,File Locked,insifficient Access</td>
      </tr>
      <tr>
         <td>Database Operation</td>
         <td>Database Table Doesnot exist,DB maintance in progress,Database Down,Network Dependency,Insufficient Access,Data Duplication not allowed</td>
      </tr>
      <tr>
         <td>Sending Daily Report</td>
         <td>SMTP Server Issue,Report File Locked</td>
      </tr>
      <tr>
         <td>Version</td>
         <td>Script was develioped for a particular version which was not available in actual production environment </td>
      </tr>
   </tbody>
</table>

- There are `2 types of Error` in `Powershell` which are of 
  -  Terminating Error 
  -  Non-Terminating Error 

###### Terminating Error :-

- A terminating Error is an error that will halt or stop the fundction or an operation 
- Any type of `syntax error` or `out of memory` are the terminating error which will make the operation and function execution as failed 
- Terminating Error can be caught and Handled as well 

###### Non-Terminating Error :-

- In case of `Non-terminating Error` the script will continue with its execution  for the next set of command 
- These are the `Error` provided by the `cmdlet` command
- we can't capture them in the script  using the `Try/Catch/Finally` block
- we need to make the` Non-Terminating Error` as `Terminating Error` So that the Script can Terminated `in case if error`


##### How to convert a NOn-Terminating Error into Terminating Error in Powershell

- we can use the `-ErrorAction` parameter  on any `cmdlet` to define `incase of an Non Terminating Error` what will be action point
- we can mention the `-ErrorAction or -EA` to any of the `cmdlet` of the powershell
- the paramter uit allow are listed below 
  - Continure
  - SilentlyContinue
  - Stop
  - Quite
  - Ignore
  - Suspend
  - Inquire

- here when we mentioned as `continue/SilentlyContinue/Quite/Ignore/Suspend/Inquire` the Error info are not displayed to the console
- in case of `stop` it will be written to the console with `Write-Error` statement 

- Even instead Of mentioning the `-ErrorAction <action item> ` to every `cmdlet` we can define the `$ErrorActionPreference` and set the `action accordingly`
- at any point of time  we want to change that we can change that by `redefining the variable` out in here 

- In Order to capture the `Error Raised` we can use the `-Error-Value <variable name> or -EV <variable name>` whill will capture the error in case of  `continue/SilentlyContinue/Quite/Stop` 
- we can also get the `error details` by using the `$<Error Variable>` over here in this case

- when we mention the `action item as stop` to the `-ErrorAction` as `ErrorAction <stop>` its been written to the `Write-Error` if not handled
- if Handled then it will go the `catch` block of the `specific error`

- we can access the  `Exception Message and Excweption Error` that got  raised while executing the `Powershell` as 
- `$_.Exception.Message` will provide the exception message
- `$_.Exception.ItemName` will provide the  exception that got raised during the Process 

- By using the `ErrorAction/ErrorActionPreference` as `Stop` then we can make the `Non-Terminating Error`  into an `Terminating Error` and Handled that with `try-catch-finally` block

#### How to Use Try-Catch-Finally  Block in PowerShell 

- we can use the `Try-Catch-Finally` block with below syntax

    ```
        try{
            # risky statement to be executed with -ErrorAction <action name> -ErrorValue <val>
        }
        catch[<Exception which is optional in Natuare>]{
            # statement to be executed if try have some exception 
        }
        finally{
            #statement to be executed always in case of exceptioon raised or not raised 
        }

    ```
- here also we can `define the try` block either with a `catch or finally block`
- we can have one or more `catch block` to handle the multiple or single error 
- The Exception in `catch block` is optional if we don't know the exception type then we can define the `catch block without the Exception`
- if `non of the exception` matching then that default `catch` block will going to get executed
- we can define `zero or one` finally block while using the `try and catch` statements 
- `finally` block will going to get executed even if the script `throws an exception or not throw an exception`
- But we can define `statement` inside the `finally block` which will going to `exit the terminal as well`

##### How to Create the Custom Exception in Powershell 

- we can use the `throw` statement to `throw a custom exception` as well 
- while defining the `throw` we can mention the `message` as `throw <msg we want to throw>`



- we can get more help on the `Try-Catch-Finally` by using the `Get-Help aboubt_Try-Catch-Finally -ShowWindow aboubt_Try-Catch-Finally `


