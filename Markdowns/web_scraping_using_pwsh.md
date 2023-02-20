#### How to Perform Web Scraping Using Powershell ####

- `web scraping / Web Harvesting / Web Data Extraction` is the data used for `extracting data from the  website`
- web scraping software need access to the `Wrold Wide Web` using the `Hyper Text Transfer Protocol` or through the `Web Browser`
- web scraping means `fetching the webpage and extracting the data from it `
- where the `Fetching` means `Downloading a page` which being done  by the browser which is known as `web crawling`
- web pages are build using the `Html or XHtml`
- web scraper sits between the `Remote Website` and `Data we want to Store to can be DataBase or FlatFile`

#### How to Use Powershell To Access A WebPage #####

-  Here we are using the Powershell to used as a `web scraper` 
-  if we want to access the web-page we need to use the `Invoke WebRequest` cmdlet which send `Http/Https/FTP/File Request` to the web-page or web services
-  it parse the `response` and `return a collection of HTML Elements`
-  this `Invoke-WebRequest` cmdlet was introduced in the `Powershell 3.0`
-  the `collection` that we got after request using the `Invoke-WebRequest` cmdlet have info about `status-code`,`images`,`links`,`path`,`Form` info as well
-  we can get the status code for an web page by using the `$<collection object we got from the Invoke-WebRequest>.statusCode` which will be `200/300/400/500`
-  we can also see the status description by using it as `$<collection object we got from the Invoke-WebRequest>.StatusDescription` which will be of `Ok or any error`
-  if we want to fet all the links for the web page `$<collection object we got from the Invoke-WebRequest>.Links` will provide `all the links with tag `for the webpage
-  if we want to fetch only the link then we need to use the `Select-Object` with that as `$<collection object we got from the Invoke-WebRequest>.Links | Select-Object href`
-  if we weant to Put all the Links to a file then we can do that using the command as `$<collection we got from Invoke-WebRequest>.Links | Select href | Out-File '<location of the outfile>'`
-  we can fetch the `Raw-Content` of the webpage by using it as `$<collection we got from Invoke-WebRequest>.RawContent`
-  if we want to search for a particular value then we need to use the `Select-String` cmdlet as below  to get it from the `Raw-Content`
-  we can also use the `$<collection we got from Invoke-WebRequest>.getElementByTagName("<search Tag>")` we can get the info about the element
-  we can also get the `Form info` by using the `$<collection we got from Invoke-WebRequest>.Forms.Field` we can get the form level info in here

- we can see all the `Property and method` of `$<collection we got from Invoke-WebRequest>` by using it as `$<collection we got from Invoke-WebRequest> | Get-Method`
- we can also see the info about the web scraping by using it as `$<collection we got from Invoke-WebRequest>.ParsedHtml | Get-Member`

- we can get the info about the `web-request` by using it as `$<collection we got from Invoke-WebRequest>.ParsedHtml.getElementByTagName("<search Tag>")` 
- if there were multiple elements then we can get hold of `element` using the concept of `index`
- in a table we can access the `rows` property on the `table object` which we got from  `$<collection we got from Invoke-WebRequest>.ParsedHtml.getElementByTagName("<search Tag>")` 
- by using the `indexing` we can access a particular `row` info as well 
- we can use the `innerText` property on the `Element` to get the `Actual Text for the same`


#### How to Download the  Image from Webpage using Powwershell #####

- we can use the `Url` of the `picture` to fetch the image from internet and on the OutFile we can save those images
- also we can use the method as below as well
- we need to create the object of  `System.Net.WebClient` class
- on the `object of System.Net.WebClient class ` we have `DownloadFile()` method which takes the `image url` and `location where we want to store as the args` using which we can download the images
- we can use it as below 

    ```
        $url="<web link of the picture>"
        $path_to_save="<location where we want to save the info>"
        #creating the object of `System.Net.WebClient` class
        $web_obj=New-Object System.Net.WebClient
        $web_obj.DownloadFile($url,$path_to_save)

    ```

- if we have multiple image to download we can run a `foreach` for this
- we can get all the `Image Url ` of the `Web-Page` by using it as `$<collecvtion obj we got from Invoke-WebRequest>.Images.src`


- we can get the `Help` by using it as `Get-Help Invoke-WebRequest -ShowWindow`