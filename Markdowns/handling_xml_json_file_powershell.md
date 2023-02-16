#### Handling XML and JSON File Through PowerShell ####

- XML used to  describe the data using the `MarkUp`
- XML Stores the data into `Tags` as well where each tag need to be closed  and if not closed considered as the `invalid XML`
- XML standard is a `flexible way create info format` and Electronically `Share the Structure Data` via ` Public Internet or Corporate Network `
- Both the `XML and HTML` contains `markup` to  describe the `page or file content`
- the `starting Tags `are known as the `Root Node` in the XML File
- the `root-node` can have multiple `child node` which are further devided into multiple `childs` as well 


- we can read the Data using the `Get-Content` cmdlet and then type-cast into the `xml` type as below 
    
    ```
        [xml] $xml_content=Get-Content -Path "<Path of the xml File >"
        #now we can see the type of that by using th `GetType()` method as below 
        #the below syntax provide what type of object we are gettting which is if System.Object type
        $xml_content.GetType()
        #we can also get the Properties by using the `Get-Member` property as below 
        $xml_content | Get-Member
        
    ```

    ```
        #Defining the XML Sheet Out in here
        [xml]$xml_var=Get-Content -Path ".\Section3\comp_info_sample.xml"
        #reading the Entire XML Document
        # Write-Output $xml_var
        #fetching the root element first child over here
        # Write-Output $xml_var.MAIN_NODE.FirstChild
        #ferching it by the Tag Name as GetElementByTagName Merthod
        Write-Output $xml_var.GetElementsByTagName("APPLICATION_INSTALLED")[0]

    ```

- By using the `XML Node` we can get the `XML Content` out in here from the `XML object` that we got from the `Get-Content` method and type casting to the `XML object`
- we can use that as below 
    
    ```
        #iterating over the element to fetch individual values as below 
        [xml]$xml_var=Get-Content -Path ".\Section3\comp_info_sample.xml"
        #here we are typecasting into an xml object which is  of XML Type
        foreach ($item in $xml_var.MAIN_NODE.COMP){
            Write-Output $item.NAME
            Write-Output $item.IP
            Write-Output $item.DOMAIN
            Write-Output $item.APPLICATION_INSTALLED
            Write-Output $OWNED_BY_TEAM
        }
    ```

- we can Gett the `First Child Node all info ` by using as `$<variable for xml>.<root-node>.FirstChild` using this we can get all the info about the `FirstChild` node present in the `root-node`
- we can also use the `$<xml object we got from Get-Content>.<root-Node>` by using this we can access the `root-node in here`
- we can also use the `$<xml object we got from Get-Content>.<root-Node>.<child-node>` to access the `Child Node of the root-node` ion this case
- 


- we can get more info about the element by using the Tag as below 
- by using the `GetElementByTagName("<tag name>")` over the `xml element` we can able to get the  Element out in here 
- by using the `forloop or foreach loop` to fetch all the content that we have `child node` in this case





##### How to Save XML info to Powershell ######

- By using the `Export-Clixml <file path of the cml>` we can create a `New XML` file in this case out in here

    ```
        # here we want we can save the `Poershel;l Object` into a file  which is of xml nature we can do that using the `Export-Clixml` cmdlet in here 
        #the `Export-Clixml` takes the file name as xml file to which we want to save the data
        Write-Output $(Get-Process -Name "*_ise") | Select-Object * | Export-Clixml "output_new.xml"
    ```


##### How to Read a JSON File in Poershell ######

- we can read the JSON file by using `Get-Content` cmdlet with converting the Output to JSON by using the format as `Out-String` and `ConvertFrom-Json`
- here the `Get-Content along with Out-String and ConvertFrom-Json` will provide the `Json object` as the return value 
- we can see it type `$<json obj>.GetType()`
- we can also see the method available to it by using the `$<json-object-variable> | Get-Member`
- we can access the `key` as the `property` as `$<json object variable>.<key name>`
- we can see more info on the same by using the `Get-Help ConvertFrom-Json -ShowWindow` which will show the window for the `Help`
- we can use the `ConvertTo-Json` cmdlet with  `Out-File` cmdlet we can `create` the json file 
- also while creating the `JSON` file we can use the `-Force` flag to force the creation of `JSON file `


- we can use the `Get-Content -Path "<json file path>" | ConvertFrom-JSON` to get the JSON Data from a particular file 

    ```
        #here we are reading the JSOn Content Out in here as below
        $json_file=Get-Content -Path ".\data.json" | Out-String | ConvertFrom-Json
        #writing the JSOn file after getting it Loaded
        Write-Output $json_file
        #fetching all the Key and value out in here as below 
        Write-Output $json_file.COMP_INFO
        Write-Output $json_file.COMP_INFO.Name
        Write-Output $json_file.COMP_INFO.machine_name
    ```


- we can Test the JSOn Being Valida or Not  by using it as 

    ```
        Get-Content -Path "D:\computer.json" -Raw | Test-JSON
        # by using the `Test-Json` cmdlet we can validate out Json being valid or not 
    ```