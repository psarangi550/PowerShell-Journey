##### How To Use Module in Powershell ####

- what modules by default `available to you in Powershell`
- How to `Install Module from Internet`
- How to `Create Module and Install Module that we have created`

- By default all the module of Powershell available in `$env:PSModulePath`
  - we can see the first one belong the `C:\Users\*` which is dedicated for a specific user
  - we can see the 2nd one `C:\ProgramFiles\*` whichis for all the user in the `Powershell`
  - wer can also see the 3rd one with `C:\Windows\System32` that will come by` default with the window`
- if we want to isntall the module then we can installed it in the location as below 
  - `C:\Users\*` which is dedicated for a specific user (which is for the dedicated user)
  - one `C:\ProgramFiles\*` whichis for all the user in the `Powershell` (which is for the all the user in the PC)

- The `Get-Module` cmdlet will help in see all the modules availables foer the `current powershell sesssion`
- if we want to see all the modules available then we can see that by using it as the `Get-Module -ListAvailable` which will show all the module available not just in the current session but in total all the modules available (for all the user and which comes by default with the window)


#### How to Import a Module in PowerShell ####

- we can import a Module by using it as `Import-Module` cmdlet with the `switch` as `-Name <name of the module>`
- we can import the module as below `Import-Module -Name WindowsUpdate` #here we are importing the WindowsUpdate module presernt in the `default windows powershell location` which is of the `c:\Windows\System32` location
- `Import-Module -Name WindowsUpdate` # By this way we can import the module in here


#### How to See What Are the Commands Avaialable in the `WindowsUpdate` Module ####
 
- we can see that the `Get-Command -Module <Module name>` will show all the commands available in that specific module 
- this will show all the function and class and variables available in the `Module` as well in here 
- Sometimes if we have imnported the module and made some changes to the module then those changes will not be reflected by default 
- in that particular case we need to use the `-Force` which will be able to `reload` the module with the `required changes that we have made`
- so we can import as below `Import-Module -Name <module name> -Force` #this is reload the module installtion as




#### How to Remove a Module in Powershell #####

- we can remove a modsule by using it as `Remove-Module -Name <module name>`
- even if we remove the module which is in `Windows or All User Location` as its present in the `Windows` and `AllUserLocation` it will still going to get working 
- But if our mnodule present for the `C:\User` and we remove it by using the `Remove-Module -Path <mopdule path>` then also we will end up getting the error in that case
- once we remove the `User Defined Module` we can't use that `module function ` over here we need to recreate it

#### How to Create Our Own Module ####

- while saving the `created module with function` we have to `create the folder  with the same name as your module name` 
- the powershell module name should have the extension of `.psm` which stands for the `Powershell Script Module`
- Once we created the `module`  with required `functionality` then `we need to create the manifest for them` to create 
- for creating the `Manifest` we can create that by using the `New-ModuleManifest -Path <folder with the same name as module where the .psm file being created>\<name of your module>.psd1 -author "<Name of the author>" -Description "<Desctiption we want to use>" -RootModule <name of your module>.psm`
- here the `psd1` stands for the powershell data file which is for the Manifest
- once we run the `New-ModuleManifest` command it will create the `Manifest file as psd1` in the same folder as the `module wherte its been stored`
- in the manifest file we can define the `Minimun Powershell Version thats being required`
- we can also mention the `function and cmdlets that we want to export`
- Now we can copy the folder where the `.psm and .psd1` file being saved it to the `User Defined Location` so that we can import by using the `Import-Module -Name <Name of the Module> _force`
- we can see all the Modules and our module will be listed doen there as below `Get-Module -ListAvailable` will liosty out the `All-User` and `Windows` MOdule as we have Put Our Module into it then we can see out module also listed down there 
- if we have not copied and pasted to the `All-User`/`Windows` Module path then we can run the  import command as `Import-Module -Path <path to the folder containing the script module i.e .psm>`
- we can see alll ther `Propery of Out Module` then we can do that by using `Get-Module -Name <modulename> -ListAvailable` if we put the folder into the `All-User or Windows` directory
- if we have not put then we can seee the same thing by using it as `Get-Module -Path <folder name of the module > -ListAvailable`


- if we copied the `folder` to the `All USer or Windows Account` we can use `the function `without importing as `When Powershell Load it load all the modules in All User or Windows directory`
- if we have not copied to the `All User or Windows Account` then we need to import `Import-Module -Path <Path to the Folder>` the same befor using it


#### How to Install Module from Internet ####

