# $var1="Hello There"
# Write-Output $var1

<#
# remove variable in case of here 
$Global:var2="Hello World"
Write-Host $var2
Write-Host  $var2.gettype()
Remove-Variable -Name var2
Write-Host $var2
#>

# checking the variable type in here
# $Global:var2=123
# Write-Host $var2
# Write-Host  $var2.gettype()


# using the Clear-Variable Option Out in here 
# $var3="Hello World"
# Write-Output $var3
# Clear-Variable -Name var3
# #here i am expecting the null value 
# Write-Output $var3


# setting the constant value in this case 
# Set-Variable -Name pi -Option Constant 100
# # #now wring that the console here as below 
# Write-Host $pi
# #now here we are changing the valiue of the variable which is constant 
# $pi=123
# ###here we will get an errir