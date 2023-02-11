# if ("abc"-eq "ABC"){
#     Write-Output "True"
# }
# else{
#     Write-Output "False"
# }


#here we can validate the user input result as well 

# $var1= Read-Host "Provide a Value"
# $var2= Read-Host "Provide another Value"

# if ($var1-eq $var2){
#     Write-Output "True"
# }
# else{
#     Write-Output "False"
# }

# Srtoring the value of the if else to a variabe 

[int]$var1=Read-Host "Enter a Number"
$result=if ($var1 -gt 10){Write-Host $var1}else{Write-Error "Number is not a valid number"}
Write-Host $result