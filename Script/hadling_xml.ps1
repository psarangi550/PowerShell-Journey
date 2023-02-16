#Defining the XML Sheet Out in here
# [xml]$xml_var=Get-Content -Path ".\Section3\comp_info_sample.xml"
#reading the Entire XML Document
# Write-Output $xml_var
#fetching the root element first child over here
# Write-Output $xml_var.MAIN_NODE.FirstChild
#ferching it by the Tag Name as GetElementByTagName Merthod
# Write-Output $xml_var.GetElementsByTagName("APPLICATION_INSTALLED")[0]


#iterating over the element to fetch individual values as below 
# [xml]$xml_var=Get-Content -Path ".\Section3\comp_info_sample.xml"

# foreach ($item in $xml_var.MAIN_NODE.COMP){
#     Write-Output $item.NAME
#     Write-Output $item.IP
#     Write-Output $item.DOMAIN
#     Write-Output $item.APPLICATION_INSTALLED
#     Write-Output $OWNED_BY_TEAM
# }


# here we want we can save the `Poershel;l Object` into a file  which is of xml nature we can do that using the `Export-Clixml` cmdlet in here 
#the `Export-Clixml` takes the file name as xml file to which we want to save the data
Write-Output $(Get-Process -Name "*_ise") | Select-Object * | Export-Clixml "output_new.xml"


