# Here we can Write a Function as below 

# function Say-Hello {
#     Write-Host "Hello world!"
# }

# #we can call the function with their name only same as the `Shell Script` in this case
# Say-Hello



# fuinction with Args value

# function  Wish-Good{

#     $total=$args[0]+$args[1]
#     Write-Output $total

# }

# #now while calling we can call the function as below

# Wish-Good 10 20


# we can also define the function as below as this 
# function Wish-Luck($var1){
#     Write-Output $var1
# }

# #while calling we can call them as 
# Wish-Luck 10


#defining the variable which will take $arr1 array as an args
# function Iterate-Array($arr1){
#     foreach ($item in $arr1){
#         Write-Host $item
#     }
# }
# #while calling we can call using it as below 
# $arr1=@("pratik","rika","papali","pupuli")
# Iterate-Array $arr1
# #calling the function over here 


# function with param block to specify parameters 

# function Multi-Value(){
#     param(
#         [Array] $arr,
#         [String]$val=0
#     )
#     foreach ($item in $arr){
#         Write-Host $item
#     }
#     Write-Host $val
# }

# $arr1=@("rika","pratik","papali","pupuli")
# #calling the function over here 
# Multi-Value -arr $arr1 


# we can also pass the args as collection and Normal DataType as well 
# function Use-Args($hash1,$val1){
#     #using the foreach loop to iterate over multiple keys out in here
#     foreach($key in $hash1.keys){
#         Write-Host $has1.$key
#         #fetching the Value from the HashTable in here 
#     }
#     #writing the output into the console out in here 
#     Write-Output $val1
# }

# #calling the function over here 
# $hash1=@{
#     "name" = "pratik";
#     "age" = 30 
# }
# $val1= "Hello World! "
# Use-Args $hash1 $val1



#function with params block with validateSet args as below 

function Use-Validate(){
    param(
        [ValidateSet("n","y")][String]$val,
        [ValidateCount(0,5)][Array]$arr=@{}
    )
    Write-Output $val
    foreach($item in $arr){
        Write-Output $item
    }
}

$arr1=@(10,20,30,40,50)
$val1="y"

#calling the function over here as below
Use-Validate -arr $arr1 -val $val1