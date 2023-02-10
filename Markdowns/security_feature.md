### Various security feature of Powershell 

- if we have an `.bat` script upon double click it will be executed by default 
- but when we have `powershell script with .ps1` then when we double click then it will just be open in the `notepad` rather than executing 
- As powershell by default associated with the `notepad` hence it will just open in the `notepad` rather than executing
- while executing the `powershell` script we need to provide the `absolute path` in order to get executed and if we are providing the `relative path` then we can just provide the n we need to provide the `.ps1` extension along with it 
- this will help in making the `built in command` separated from the `script` that we wrote 
- we can make the `Execution Policy` as `RemoteSigned/AllSigned` which will help in execute the command by the `certified user`


#### <ins> How to` Get-Help` from Powershell 

- `Get-Help` cmdlet display info about the windows poershell `concept and commands`
- including the `cmdlets`,`function`,`CIM commands`,`Workflows`,`providers`,`aliases` and `scripts`

- we have a command on that we want the help then we can use the `Get-Help` command
- `Get-Help` provide the help about the command that we used in the scripts
- all the poershell commands are named in the form of `VERB-NOUN`
- `Get-Command` will show `all the commands available in the powershell`
- if we want to see a specific command then we can use it as `Get-command -Name "<name of the command>"`
- if we want to see a specific set of result then we can use the `select -First 5 /select -Last 5`
- while searching for the command then we can use the `*` as the `wildcard character`
- we can  use the command as `Get-command -Name "<name of the command>" | select -First 5 /select -Last 5`
- if we want to see the `help` page for a specific command then we can do that as below 
  - `GET-Help <command for which we want to see the help>`
  - `Get-Command -Name "<name of the command>" | select -First 1 | Get-Help`
  - we can add a flag as `-Full` to the `Get-Help` which will provide the detailed description of the command that we will be using 
  - `Get-Help "<name of the command>" -Full` which will show the full page of command information on the command line
  - by using the `-Online` flasg we can see the full description on the browser
  - `Get-Help "<name of the command>" -Online` which will show the full description of the command on the browser
  - we can use the flag as `-ShowWindow` which will show all the  command full info in an separate window
  - `Get-Help "<name of the command>" -ShowWindow` which will show the  help page of the command in a separate window
  - also by using the `ShowWindow` flag on the `settings on right` we can show the `specific section` of the Help page 
  - if we want to see the help for a `specific concept` then we can use it as `Get-Help <concept name> -ShowWindow`
  - `Get-Help "about*" ` will show all the `concept` thats been invilved in the powershell

- when we use the `Update-Help` then it will `download` the `Help` from the microsoft side
- we can also `save the help` into an file using the `Save-Help <file location where we want to save>`