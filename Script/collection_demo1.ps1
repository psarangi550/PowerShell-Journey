# $arr1=10,20,30,40
# #verify the type of the same by using it as $arr1.Get-Type()
# Write-Host $arr1.GetType()


# $arr2=@("pratik","rika","abi")
# #creating the array with the values as System.String 
# Write-Host $arr2


#fetching the array with the values as System.String
$arr3=@("pratik","rika")
#now we can see its properties as below 
Write-Output $arr3 | Get-Member