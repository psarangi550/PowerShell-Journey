### <ins> POWERSHELL 101

#### <ins> What is Poershell 

- VB Script and windows batch been used before to the powershell environment
- Powershell Build On  the `.net` Framework , `Powershell` is a task based `command line shell` and  `scripting Language`
- it is designed for `sys admin` and power-users to `automate multiple operating systems` and `process that run over  those operating system `


- Most of the `Microsoft Product` been` build and managed by Powershell` and `Powershell also support few other graphical interface` as well
- Powershell is `object based scripting language`
- By using `object based scripting` we can `perform sort ,filter ,measure ,group and compare `

- when we have a `powershell script` then we can use it for the` auditrail` i.e `How a particular task been happening since last 24 /12 months` can be `calculated in a minutes `
- As `sys-admin ` will perform `multiple repeated task` then `that can be done by powershell script` rather than `using a GUI` which will be an nightmare


#### Advantages of  Powershell

- Powershell is a scripted solution , that will run the exact same script , everytime   without any typos or forgetting to complete task or doing task incorrectly 
- There are many task where having the audit rail would be helpful and perhaps we can know how the task been performed ,impoertant result and error that been occured 
- we can know below info such as
  - when the task ran
  - who run those task


- from script we can ghet the result quick compared to a GUI one 

#### Purpose of Powershell 

- impove Management of multiple systems
- improve Automation
- Manage real-times, we can handle large scale enviroments with multiple application deployed on them 
- Manage large scale environments

#### How to Use Powershell ISE

- Powershell ISE :- `Powershell  Integrated Shell Environment` is a `smart integrated scripting environment` which comes along with Powershell which is free to use 
- we can open that by using as `win+r` for the `run` and click on the `search` and search for `powershell_ise`


#### <ins> Execution Policy in Powershell 

- Based on the `Execution policy` set then `powershell` will execute the `safe` script or `all kind of the script`
- Powershell execution policy let us determine the condition under which powershell will load config and run script 
- we can set the `Execution Policy` 
  - for the local computers  
  - for current user 
  - for a particular session 

- we can also use a group policy to set the execution policy for computers  and users


#### <ins> Types of Execution Policy 

##### AllSigned:-
:- Require that all script and config files be signed by the trusted publisher , when executed from the local computer prompt you as `run script` as  to mark it as `trusted and untrusted`, here if we set the execution policy as AllSigned then, All signed script will be executed without throwing any prompt once we mark ourself as AllSigned execution policy
-  A `Signed Script` have a `Script Signature ` which need to be validated before executing the script
-  there are `mutiple certificare provioder available for the same` , once we `confirm the certificate is valid then the signature being validated ` then script can run 
-  by using cerificate we can create a script signature and if a valid user been  providing the certificate we are validating that after that  script will run 


##### RemoteSigned :-
- Does not require a digital signature on the script that you have written on the local computer
- But that will not be valid option if  Script which being  downloaded script and does not have a valid signature

### Unrestricted:-
- unsigned script can run with this execution policy 
- Warn the user before running the script and config files that are downloaded from the internet 

#### Restricted :-
- permit individual command  but  will not eun the script

##### Bypass:-
- Nothing is blocked and there are no warning or prompts

- By default the `Execution Policy is Restricted` on personal computer
- On the `production env` the Execution Policy can be enforced b y the `Group Policy`
- `Group Policy` is an `document` where we wrirte all the `Policy or rules ` and impose it` on the computer in the domain ` autoimatically
- By using `Get-ExecutionPolicy` we can see the `execution policy` thats been set for us
- we can set the exection policy as `Set-ExecutionPolicy <name of the Excution Policy>` which will prompt you select `yes/yesto All/No` etc
- we can set the execution policy as `Set-ExecutionPolicy <name of the Exectuin Policy> -Force` if we wish to not to see the prompt
- `Set-ExecutionPolicy <name of the Exectuin Policy> -WhatIf` then powershell will not execute the command rather it will show what it will do 
- the `whatif` command can be given to know on execution  what will happen then we can use this command




