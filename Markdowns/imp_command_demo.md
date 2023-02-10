#### DIfferent Commands to starts with the windows Powershell 

##### Get-Location :- `show the current location as pwd`
##### Set-Location <directory where to move> :- `changing the location like cd command`
##### Get-Date :- `Show the current Date`
##### Get-ChildItem :- `Show the child item`
##### Get-ChildItem -Recurse :-`recursively show all the child Item`
##### Get-ChildItem -Path <Where we want to see the ChildItems > :- `show child item for a particular path`
##### Get-ChildItem -Filter "*.<extension we want to see> :- `show a particular extension file `


#### Write-Output "<what we want to write>" :-  `write output to the console`
#### Write-Host "<what we want to write>" :- `write output to the console`
#### clear-Host :-  `clear the console `


##### Copy-item -Path <src> -Destination <dest>:- `copy the file and folder from src to dest`
##### Copy-item -Path <src>\* -Destination <dest>:- `copy all the file and folder  from src to dest`
##### Copy-Item -Path <src>\* -Destination <Dest> -Recurse :- `copy all item from src to the destination`


##### Move-Item -Path <src> -Destination <dest> :- `move the item from src to dest`
##### Copy-item -Path <src>\* -Destination <dest>:- `move all the file from src to dest`
##### Copy-Item -Path <src>\* -Destination <Dest> -Recurse :- `move all item from src to the destination`


##### Copy-Item -Path <src>\<file name> -Destination <dest path>\<new file name> :-`copy with rename`
##### Move-Item -Path <src>\<file name> -Destination <dest path>\<new file name> :-`move with rename`


##### Rename-Item -Path <src>\<Filename> -newName <New File Name> :-`rename with filename`
##### Rename-Item -Path <src> -newName <New Folder Name> :-`rename with folder`


##### Remove-Item -Path <src>\<Filename> :-`remove with filename` 
#####  Remove-Item -Path <src> :- `remove the  foldername`
##### Remove-Item -Path <src> -Recurse :-`remove the directory recursively `

- we can define the  comments in `powershell` as with the `#` symbol
- for `multiline comment` we can use `<# commands #>`  in powershell for multiline comments 


- we can use the location of the directory byt using the `Get-Location` command
- to change the location we can use the `Set-Location` command as `Set-Location <location where we want to reach>`
- for getting the `Date` we can use the command as `Get-Date`
- for gettting all the files and the folder we have to use the command as `Get-ChildItem` which will be simiplar to the `ls` command in the `Shell Script`
- if we want to `search in the folder and subfolder `recursively then we can uise the command as `Get-ChildItem -Recurse`
- if we want to fetch `files and folder` underneath the `path` then we can pass the `-Path` flag as `Get-ChildItem -Path <Where we want to see the ChildItems >`
- if we want to see a `specific sort of child items` then we can use the `-Filter` flag alongside the `Get-ChildItem -Filter "*.<extension we want to see>"`
-  we can see a `specific sort of child items` then we can use the `-Filter` flag alongside the `Get-ChildItem -Path <src>\"*.<extension we want to see>" `


- to print something to the console we can use the command as `Write-Output "<what we want to write>"`
- we can also write the data to the console by using it as `Write-Host "<what we want to write>" `
- to `clear the console` we can use the command as `Clear-Host`



- to `copy` a `file/folder` from `one location to other location `we can use it as `Copy-item -Path <src> -Destination <dest>`
- if we want to copy all the files then we use the `*` wildcard as `Copy-Item -Path <src>\* -Destination <dest>`
- we can add the `-Recurse` flag to copy all the folder and subfolder recursively to the Destimatation location as `Copy-Item -Path <src>\* -Destination <Dest> -Recurse`


- to `move` a `file/folder` from `one location to other location `we can use it as `Move-item -Path <src> -Destination <dest>`
- if we want to move all the files then we use the `*` wildcard as `Move-Item -Path <src>\* -Destination <dest>`
- we can add the `-Recurse` flag to move all the folder and subfolder recursively to the Destimatation location as `Move-Item -Path <src>\* -Destination <Dest> -Recurse`


- if we want to rename the `file name` after `copy or move` we can mention that in the `Destination <dest path>\<new name>` as  below 
  - copy with rename:-`Copy-Item -Path <src>\<file name> -Destination <dest path>\<new file name>`
  - move with rename:-`Move-Item -Path <src>\<file name> -Destination <dest path>\<new file name>`
- we can use the `Rename-Item -Path <src>\<Filename> -newName <New File Name>` and `Rename-Item -Path <src> -newName <New Folder Name>` to rename the folder name


- for `deleting` the item we  can use the command as below `Remove-Item -Path <src>\<Filename>` 
- for `deleting recursively` we can use as `Remove-Item -Path <src> -Recurse`


-  we can use the `Get-Help` on all those command we have learned above


-  we can see the `History` of all the copmmands we can use the `Get-History` command
-  by using `Clear-History` we can clear the Hostory of `Get-History`

-  the `Show-Command` will show all the commands  which we can see on the `right of the Powershell`