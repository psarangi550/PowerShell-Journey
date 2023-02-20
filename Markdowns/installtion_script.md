####  How To Install Software Using Powershell ####

- if we have to installed a particular software we need to check the below steps 
  -  Software being already installed or not
  -  Locating the Installer File (it could in the Network Shared Drive or Or From the Internet)
  -  Install Required Software if not installed already
  -  Log the Info into the System

- if we have to install the software then we can do that using the `Adminstrative Access`
- if we want to see the `all 32 bit software that being installed` then we can see that using the `Registry Editor` on the location of `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*`
- if we have to see the `All the 64 bit software that being installed` then we can so that using the `Registry Editor` on the location of 
`Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*`
- by default the `Powershell` refer `registry` as `Computer\HKEY_LOCAL_MACHINE\` can be used as `HKEY:\`
- By using the `Get-ItemProperty` we can able to see that `Software Installed` on the `Registry Setting` of the `32bit or 64 Bit System`
- when we have the `Software Installed` info we can filter out `DisplayName,DisplayVersion,Publisher and InstallDate` which can be be provided to the `Get-ItemProperty` as pipeline with the `SelectObject wirh -Property flag` which will provide a `Array of all 32/64 bit Software installed`
- we can both the `32 bit and 64 bit ` software to find all the softwarer that are installed on the sysytem
- But we have to Make Sure Both the item being filter out by `DisplayName,DisplayVersion,Publisher and InstallDate` same property
- we can compare the software present or not by using the `$<all software after adding the 32 bit and 64 bit>.DisplayName -like "*our required software*" `

- we can also validate the same in the `control panel --->Software ----> Uninstalled Software`
- by using the `Exit` which can take us out of the `Powershell Terminal`


- if we have a software on a particular `Network Location` then we can mention that as the `Source Location`
- we can define the `Destination Location where we want to get that .exe file from the source location`
- if we are ok to install from the `Internet` then we can use the `link to the .exe` and use that as an url
- we can create the `Folder` in powershell by using the `New-Item` cmdlet
- we can also provide the `-ItemType` flag and specify against it as `Directory/File`
- we can also provide an option of `-Force` in order to force the creation of the Directory
- so we can write that as `New-Item -Path <where we want to create the Directory> -ItemType Directory -Force` 
- if the `Folder` does exists then  `New-Item -Path <where we want to create the Directory> -ItemType Directory -Force`  will not do anything, if not there then it will create the directory
- we can check the `folder/File` being `Present or Not` by using the `Test-Path` property as `Test-Path <Directory or File we want to check>`


- from the `Website` if we want to install a file then we have to use the `invoke-webrequest` cmdlet using the `-Uri` as flag against which we can provide the `URL` path
- we can also mention the `-OutFile` flag to redirect it to the `specific location`
- we can also provide the `-Verbose` flag to see the `Installation thats been going on`
- we can write ther Total command as `Invoke-WebRequest -Url <url> -OutFile <outfile location with the .exe file location> -Verbose`


- In order to Install an `.exe` file we need to use the `Start-Process` cmdlet and we need to `mention the path of the installtion`  against it 
- we need to pass the `Switch` as `/S` which is for `Silently Installing the .exe file`
- we can also provide few oiptional switch such as `-NoNewWindow -Wait -Passthrough` as well against the `Start-Process` cmdlet
- we can mention the whole command as `Start-Process <Path to the .exe file> /S -NoNewWindow -Wait -Passthrough `

- once the software being iunstalled we can revalidate the same using the command as `Get-ItemProperty from the location of both Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* and Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ ` location


#### How to Log in Powershell ######

- we can use it as  `Start-Transcript -Path "<Path of the Log File>" -NoClobber -Append` cmdlet to see the `logs` into the `LogFile`
- at the end we can use the `Stop Transcript` to `Stop the Transcript option out in here`
- we can also provide the option as `Force` if we want to force the installation over here



#### Additional Options #####

- if we are opening the `.msi/.exe`  file it can open `different prompt` to install the `particular script`
- for the `.msi` file we can execute as `.msi /?` which can suggest what are the params it took to install the `file`
- if we are providing the `.msi /quite` it will going to  install the `particular script` quitely
- we can also provide the option of `.exe /?` to how oit prompt to install the file


- if we have `chocoletty` or `scoop` installed then we can use the `respective command` to install the script
- How to perform `error Handling`
- Installing multiple `.exe` files at a time by using the `ForEach-Object` cmdlet
- we can also use the `Invoke-Command` to execute the Script on the `remote computers`
- while using the `Invoke-Command` to install on the `remote system` we can use the `Invoke-Command` with the `-ComputerName` by providing the `Computer Host Name`
- we can also provide the `-Credetional` while using the `Invoke-command`
- we can also mention the `Path` in which the `remote script ` exists
- and also we can provide the `-ScriptBlock` as `{Get-Culture}` to execute the script
- we can mention all that as `Invoke-Command`
- so the `Invoke-Command` can be written as below `Invoke-Command -Path <path> -ScriptBlock {Get-Culture} -ComnputerName  <your remote computer hostname> -Credetional <Domain>\<Username>`

