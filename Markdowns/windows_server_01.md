#### Windows Server #####

- Here we know about the Windows Server Different functionalties
  - Windows  Process
  - Windows Services
  - Task Manager
  - Task Scheduler 

##### Windows Process :-
  -  A `Process` is an `instance of a particular executable`
  -  An Application consist of `One or More Process `
  -  `Each Process` `provide` the `resources` whcih is responsible top` execute the program`
  -  `Each Process `Starts with a `Single Thread` called the `Primary Thread`
  -  But  the `primary thread` can create `additional thread `from any of this `Thread`

  - we can see the `List of Process Running` by using the `Task Manager-->Processes`
  - we can also add additional column to iut by using it as `view-->select column` over the `Task Manager`
  - Each Process Having a `Name` and a `Unique Process ID` which stands for `PID`
  - we can also see the `User Account` on which that `process been running  on windows`
  - we can also see the `CPU as well as Memory Utilization` of the same 
  - we can see the `executable thats been running` on the `Process` in here
  
  - As the `Application` are made of `Process` if we kill the process the `Application` will also going to be stopped 
  - The `system Performace `depends on the `Hardware Limitation` i.e the `CPU Uage and Memory Usage`
  - When the `Memory got high `then thr `system performace` will also be `degrading`  and `CPU uage` also `incresed`
  - in case of the `Process` we can see `What are the process taking a lot of cpu consumption`
  
  -  A `Windows Process` can interact with the `User`
  -  we can access the `Windows Process` in Powwershell

#### How to Use the `Get-Process` cmdlet in Powershell 

- The `Get-Process` cmdlet allow us to see all the `processes` running on `our system`
- the  `Get-Process` cmdlet without any paramter provide all the `process` running on the `local system`
- we can specify a particular `PID`/`Process Name` then we can get the `info about that specific process` in powershell as `Write-Output $(Get-Process -Id <PID>)` or `Write-Output $(Get-Process -ProcessName <Process Name>)`
- the `Get-Process` cmdlet return a `Process Object` which has all the `info needed for the process` which can be fetched by `Write-Output $((Get-Process).GetType())`
- the returned `process-object` has the `Supporting methods` to `start and Stop the Services`  as well along with the `info`


- As the `Get-Process` return an `Process-oBject` hence we can put a `Pipeline` and `Whole Object` will be transfered in the pipeline which can be accessed by `$_` inside the `Pipeline`
- We can sort the Object using  the `Sort-Object or sort(alias)` for sorting which takes the `column name` `with which we want to sort` and `sort ascendingly by default `
- but if we want to sort in the `descending` manner we needc to pass the `-Descending` flag to it 

    ```
        Write-Object $(Get-Process) | Sort-Object <Column name with which we want to sort > -Descending # if we want to sort Descending 
        OR Write-Object $(Get-Process) | Sort-Object <Column name with which we want to sort >  # to sort it Ascending
    ```

- Same Like `Sort-object or sort` for `Sorting` hence we also have the `Select-Object` to `select few chuck of the output as well` 
- by using the `Select-Object` we can able to fetch the `First/Last` few objects by using the `-First <number>/-Last<number>` flag into it
- we can also use the `Select-Object` with `Sort-object` by pipeing them together

    ```
        Write-Object $(Get-Process) | Sort-Object <Column name with which we want to sort > -Descending | Select-Object -First 5 # if we want to sort Descending  order First 5 result
        OR Write-Object $(Get-Process) | Sort-Object <Column name with which we want to sort > | Select-Object -Last 10  # to sort it Ascending and finding the Last 10 Object
    ```

- we can also search for a specific process by their name as well by using the `-Name` flag as below 
  
  ```
    Write-Object $(Get-Process -Name="*process name we want to seach*")
  ``` 

- we can also get all the Properties of the Process by using it as `Select-Object` with `*` flag with them
    
    ```
        Write-Object $(Get-Process -Name="*process name we want to seach*") | Select-Object *
    ```

- if we have a condition to find such as `Process where CPU utilization is > 1000` thern we can use the `Where-Object`
- so we write that one of by as `Where-Object {$_.<property> -gt 100}` where `$_` current `Get-Process object in the pipeline`
    
    ```
        Write-Object $(Get-Process -Name="*process name we want tosearch*") | Where-Object {$_.CPU -gt 100}
    ```

- if we want we can also `Stop a Process` by using the `Stop-Process` Object as below 
- this command should be uased `conciously` while using the `Process`
- we can put a flag called `-WhatIf` to see what the `Process` been doing  but restrict `Powershell` to perform that action
   
    ```
        Write-Object $(Get-Process -Name="*process name we want tosearch*") | Where-Object {$_.CPU -gt 100} | Stop-Process
        
    ```

- we can also save the output to file using the `Out-File` cmdlets as below 

    ```
        Write-Object $(Get-Process -Name="*process name we want tosearch*") | Where-Object {$_.CPU -gt 100} | Out-FIle  <file-name to which we want to save >
    ```


- We can Get More  info about the Process using the `Get-Hep Get-Process -ShowWindow` cmdlet to use that 

##### Windows Service :-

  - `Windows Service` is a `computer Program` which been `running on the background` which being similar to the `unix daemon` 
  - `Services` `does not have a UI` and don't interact with the `User`
  - A `Windows sercvice` is a `Windows Process` which run on `background` and `does not interact with the desktop`
  - we can access the services running on the `Windows` by clicking on the `Task Manager` and `go to the services section`
  - we can't perform any action if we are using the `Task Manager-->Services Section`
  - rather we can access the `Service` by using the `Services.msc` where we can control the `Windows Services`
  - we can make the `service` running on a particular user account by using it as `Services.msc-->LogOn-->change the User Account`
  - we can also `Start/Stop/Enable/Disable` the services from the `Service.msc` Window


  - we can also set the `StartUp` type for the `Services as well` in this case
  - we can manage the `Windows Services` using the `Powershell` as well in this case
  - we can schedule the `Services` to start `Daily/Weekly/Hourly` using the `Poewershell` in `different computers`
  - `Windows Services`can also be achieved by using the `Powershell` as well 


#### How To Use the `Get-Service` cmdlet in Powershell

- the `Get-Service` cmdlet allow us to see the service of `own computer or remote computer` and return a `Service` object
- the `Get-Service` cmdlet will allow us to see the `Running and Stopped Services` as well in this case
- we can fetch a particular Service-Name using the `Get-Service` cmdlet as well  by using the `Service-name` or `Display Name of the Services`
- we can also pipe the result of the `Get-Service` which is a `Service-object` to another cmdlet and reference the `service object` as `$_`


- `Get-Service` cmdlet will provide all the `services` to the computer with `Running and Stopped Service` as well


-if we want  we can get the `services with their status as well` or `sort it by their status ` as below 
- we can sort the services as below 
    
    ```
        Write-Output $(Get-Service) | Sort-Object Status -Descending
    ```

- if we want to Get a Particular Service then we can use it as 
    
    ```
        Write-Output $(Get-Service -Name "Microsoft*")
    ```


-#we can get the services whose name starts with `A` then we can do that using the `Where-Object` as below
    
    ```
        Write-Output $(Get-Service) | Where-Object {$_.Name -like "M*" -and $_.Status -ceq 'running' }
        # #or
        Write-Output $(Get-Service -Name "M*") | Where-Object {$_.Status -ceq 'running'}
    ```

- we can Get-Few Services info by using the `Select-Object` as below 
    
    ```
        Write-Output $(Get-Service -Name "M*") | Where-Object {$_.Status -ceq 'running'} | Select-Object -First 2
    ```

- we can also make small chucjk out of the `big pipeline` by refactoring it with `|` symbol as below 
- in this case when powershell encounter the `|` symbol it assume the `command` will be on the same or next line hence we can break it onto the chunk like this 
    
    ```
        # Write-Output $(Get-Service -Name "M*") | 
        #     Where-Object {$_.Status -ceq 'running'} | 
        #         Select-Object -First 2
    ```

- How to Start and Stop the Service by using it as below 
- we can puyt the `Stop-Service` to stop a service
- we can also put the  `Start-Service` to start a particular Service over here
- in case of doubt we can use the `-WhatIf` flag into it as well

    ```
        # Write-Output $(Get-Service -Name "*KiteService*") | Stop-Service
        Write-Output $(Get-Service -Name "*KiteService*") | Start-Service
    ```
