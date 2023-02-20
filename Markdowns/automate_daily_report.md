####  How to Generate the Report Using Powershell and Send to Multiple Email Address ####

- How to Create a Report of the `Get-Service` cmsdlet and send to multiple email address ar once
- Lets suppose we have to fetch a `Particular Service` and ` Send their Status as report to multiple people` 
- lets suppose they are as an array having Service as `@("VSS","WinRM","TrustedInstaller","Spooler","msiserver")`
- Here by definning the `List Of Services` we can add or remove  `New Services` into it
- we can convert this to a `HTML report` by using the `ConvertTo-Html` with `-Property` flag to select a `Particular Field` out of all the fields
- also we can create the `html template` for the body and indicate that on the `-Body` field of it
- we can use the `-OutFIle <filename>` to append the result into the file and we can use the `-Append` params to append the result to the file
- we can use the `Get-Service -Name <list of service name>` which can take the name of the service into the consideration 


#### How to Execute the Script Using Bat File #####

- we can execute the `.ps1` script using the `.bat` script using it as  `Powershell.exe <location of your ps1 file >`
- Now when we execute the `.bat` script by `double click` it will auto open the `.ps1` script and try to execute the script

#### We casn Schedule the Task Scheduler which will execute the Bat Script on some duration ####

- we can create the `Task Scheduler` by using it as `Win+R--->taskschd.msc` which will open the `Task Scheduler` Window
- we can also run the `.ps1` script using the `Task Scheduler` but there are some bugs in it
- in order to run we can use the `.bat` script which will run the `.ps1` script and `.bat` will be executed by the `Task Scheduler`
- here while scheduling using the `Task Scheduler` then we can  Provide the Name `General Name`--->`Run Whether user is logged on or not`
- then we need to define the `Trigger` when we want to run the `Script` we can `Schedule` `One Time/Daily/Weekly/Monthly`
- then we need to chhose the `.bat` script as the `Program` to run which will run the `.ps1` script on the `dedicated timeline`
- But if we want to execute the `.ps1` script dirtectly then we can use the `Program as Powershell.exe` and providing the filepath as the `Args` in the `Task Scheduler` in `Double Quotes`
- we can also run the `Task Scheduler` task `Manually` by `Right Click`and `Select the Run Option over the `Task Scheduler


#### Additional Learning ####

- we can store the `Username/Port/Password/To/cc` into an `Json/XML` file and read it from there rather than mentioning on the script
- we can also provide the Error Handling Steps for the Same 
- 
