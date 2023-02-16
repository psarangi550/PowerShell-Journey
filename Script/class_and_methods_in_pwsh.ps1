# class Student{
#     [String]$name="NA"
#     [String]$age=0
# }

# $stud=New-Object Student
# #checking its type by using it as below 
# Write-Host $stud.GetType()
# #accessing the variables and Setting the variables with the value that we have provided 
# Write-Host $stud.age
# Write-Host $stud.name
# #setting up the values in this case over here 
# $stud.age=30
# $stud.name="pratik"
# #accessing the variables and Setting the variables with the value that we have provided 
# Write-Host $stud.age
# Write-Host $stud.name

#saving ther objects into the JSON file as 
# ConvertTo-Json -InputObject $stud | Out-File "mydata.json"
# we can also get the data from there by using it as below 
# $new_stud=Get-Content -Path "mydata.json" | Out-String |ConvertFrom-Json |Select-Object *
# Write-Host $new_stud
# Write-Host $new_stud.name
# Write-Host $new_stud.age

Start-Transcript -Path ".\result.log" -Append
# How to create classes with Method and Properties over here 

class MathOperation{
    [Int32]$num1=0
    [Int32]$num2=0

    [int32] Add(){
        $add_number=$this.num1+$this.num2
        return $add_number
    }
    [int32] Sub(){
        $sub_number=$this.num1-$this.num2
        return $sub_number
    }
    [String] toString(){
        return "the result of addtion operation is"+$this.add_number +"the result of substraction operation is "+ $this.sub_number
    }

}

$math_obj=New-Object MathOperation
$math_obj.num1=100
$math_obj.num2=50
$val1=$math_obj.Add()
Write-Host $val1
$val2=$math_obj.Sub()
Write-Host $val2
Write-Host $math_obj.toString()


Stop-Transcript 