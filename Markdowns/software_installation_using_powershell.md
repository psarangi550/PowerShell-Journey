#### How to Install Software Using Powershell ####

- if we have to install any software on the system then we can go through the below steps
    
    - first we need to check `whether the software being installed or not `, if installed then `skip` the step
    - then we need to `grab` the `installation file` over here, we can also `download` the file if not `present` already
    - `install the software`
    - `log the info`

- we can see all the `software installed` on the `registry` by going to `Computer\HKEY_LOCAL_MACHINE\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\uninstall` for `32bit`
- we can see all the `software installed` on the `registry` by going to `Computer\HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\uninstall` for `64 bit`
- so here we can `prepare the list of software installed` and if `out software installed then skip else do it`
- we can access the `registry` settings we can use the `Get-ItemProperty` cmdlet
- we also have to use the `Computer\HKEY_LOCAL_MACHINE` we can use the `Location` as `HKLM:`
- so in order to access the registry for 32 bit we can use as 

    ```
        #if we want to get the Property of the `32bit installed system` then we can use it as below
        $var32= Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\uninstall\* | ForEach-Object {
            Write-Output $_.DisplayName
        }
        #same goes for the 64bit system as below 
        $var64= Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\uninstall\* | ForEach-Object {
            Write-Output $_.DisplayName
        }
        #selecting very few Property out of it 
        #we can add them both to see whether the 32 bit and 64 bit present or not 
        $total=$var32+$var64
        # Write-Host $var64
        # Write-Host $total
        #here we can see the Output  in here 
        $total -clike "Python*"

    ```

- we can create a `New-Folder` in the `location` as  `New-Item <directory path as str or variable > -ItemType Directory -Force`
- this will create the `directory on the specific location out in here`
- we can download a file by using the `Invoke-WebRequest -Uri <url/variable> -OutFile <where to store> -verbose`
- 