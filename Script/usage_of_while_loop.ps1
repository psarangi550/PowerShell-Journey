# $var1=1
# While ($var1  -lt 10 ){
#     Write-Output $var1
#     $var1+=1
#     #we can increment the values by using it as $val1++ as well
# }
# Write-Output 'Finally Outside Code will be Executed'

# $val=1
# While ($result -lt 100){
#     $result=$val*5
#     Write-Host $result
#     $val+=1
# }

# $var1=1
# do{
#     Write-Output $var1
#     $var1+=1
# }while ($var1 -lt 10)


#usage of the for loop opver here
# for ($var1=1; $var1 -lt 10; $var1+=1){
#     Write-Output $var1
# }


# Loop Usage Over the Collection in Poershell 
# $arr1=@(10,20,30,40,50,60)
# for ($index=0;$index -lt $arr1.count;$index+=1){
#     Write-Output $arr1[$index]
# }


# we can use the While Loop to iterate over the Collection as below 
# $arr1=@(10,20,30,40,50,60)
# $index=0
# While($index -lt $arr1.count){
#     Write-Host $arr1[$index]
#     $index+=1
# }


# $arr1=@(10,20,30,40,50,60)
# $index=0
# do{
#     Write-Output $arr1[$index]
#     $index+=1
# }While ($index -lt $arr1.count)

#using the `For Loop` loop to iterate over the Collection
# $arr1=@(10,20,30,40,50,60)
# for ($var1=$arr1.count;$var1 -ge 0 ; $var1-=1){
#     Write-Host $arr1[$var1]
# }


#usage of the for-each loop over here is 

$collection1=@(10,20,30,40,50,60)
foreach ($name in $collection1){
    Write-Host $name
}