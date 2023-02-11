$arr1=@(200,343,4,23,42,3,42,99,100)

Write-Output $arr1.GetType()
# Write-Output $arr1 | Get-Member

#fetching the mid-element of the array

# $length= $arr1.Length
# $length=$length/2
# $var1=[Math]::Floor($length)
# Write-Host $var1
# Write-Output $arr1[$var1]


# to do a florr division we can use it as `[Math]::Floor($var)`
# for doing the round of a number we can use it as `[Math]::Round($var)`
#for fetching the  ceiling value we can use it as `[Math]::Ceiling($var)`


## fetdching the heighest number in the collection as 

# Write-Output $arr1 | Get-Member
# $var2=($var1 | Measure-Max).maximum
# Write-Host $arr1.count

# $val1=[Array]::IndexOf($arr1, [int]$maximum)

# Write-Host $arr1[$val1]

# $arr1=@(200,343,4,23,42,3,42,99,100)
# #defining the Array in here 
# $var1=($arr1 | Measure-Object -Max).Maximum
# #here we can use the [Array] object to calculate where the Maximux value present as 
# Write-Host $var1
# $index_of_max=[array]::IndexOf($arr1,[int]$var1)
# #this will provide the index of the Max Value
# Write-Host $index_of_max


# $my_courses = @("course1 # Learning Task Automations # Vijay", 
#                 "course2 # Advanced Scripting & tool making #  Vijay", 
#                 "course3 # AD Management using PowerShell /In progress # Vijay"
#                 )

# $val= $my_courses | Sort-Object -Descending

# Write-Output $val
# Write-Host $val
# # $my_courses -clike "*Task*"
# # $my_courses | sort { [int]($_ -replace '\D')}

##here  we need top Sort an Array as 

$arr1=@(200,343,4,23,42,3,100)
$val1=$arr1| Sort-Object 
#now we can write the output as below 
Write-Host $val1


# if ($my_courses.Contains("tasks")){
#     $value=$my_courses -like "*tasks*"
#     Write-Host $value
# }