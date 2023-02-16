#### What are classes and Methods in Poershell ####

- A `class` is a `Program-code-template` for creating the objects,`Providing Variable and Behaviour`
- inside the class we create `variables and methods`
- Once the class is ready we can create the `object` for the class 
- we can use those object like how we are using the `cmdlets` so far


- we can create the class as below in the syntax as below :-

    ```
        class Student{
            [String]$name="NA"
            [String]$age=0
        }
    ```

- if we want to create an Object of the `class` then we have to use the syntax below

    ```
        # we can create the object as below ovwer here 
        $<obj name>= New-Object <class Name>
        # Here also we can use the example as above
        $stud=New-Object Student
        #creating the object of the `Student` class 
        #we can see its type by using the `GetType()` on the `Object`
        Write-Output $(stud).GetType()
    ```

    ```

        class Student{
            [String]$name="NA"
            [String]$age=0
        }
        $stud=New-Object Student
        #checking its type by using it as below 
        Write-Host $stud.GetType()
    ```

- if we do a `Get-Member` on the Same we will get the `Few Default Method` provided by `Powershell` and also able to see the `Property` that we defined in the `Get-Member` method
- the object store its `state/Property` using `Variables` and exposed its behaviour using the `Function` defined in the `class`
- we can also able to access the `State/Property/Variables` using the `.` Operator  in this case
- we can also see the set the value against the `Property/Variable/State` in this case

    ```
        class Student{
            [String]$name="NA"
            [String]$age=0
        }

        $stud=New-Object Student
        #checking its type by using it as below 
        Write-Host $stud.GetType()
        #accessing the variables and Setting the variables with the value that we have provided 
        Write-Host $stud.age
        Write-Host $stud.name
        #setting up the values in this case over here 
        $stud.age=30
        $stud.name="pratik"
        #accessing the variables and Setting the variables with the value that we have provided 
        Write-Host $stud.age
        Write-Host $stud.name

    ```

- Like self we can access the `class variables` by using the `$this.$<variable name>`
- if we want to represent the `object` then we need to define that with the help of `toString()`
- but while defining the `method` inside the class `we don't have to write function keyword` over there 
- we can write that as below 

    ```
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

    ```

- we can see more help on this by using the `Get-Help about_classes -ShowWindow`
  

#### How to Save Powershell Object Into the File System ####

- we can save the `custom powershell object into the file system` and use it later `whenever required`
- The concept is `Similar` to `serialization and deserialization` that we have learned 
- we can save it to anyformat by using the `Export-Clixml` and `ConvertTo-Html/Json/Xml/CSV` format


- we can use the `ConvertTo-Json -InputObject <object name>` then we can conver that to a Json File 

    ```
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
    ```


#### How to Use the Object that we Saved into a File System #####

- if we want we can covert the `XML`content back into powershell object which can be done by using the `Import-Clixml <xml file to whichsaved>`
- if we want a few objects not all the objects then we can use the `Select-Object` in those cases which will select the `required number of objects`
- or we can store the `required number of objects` into a `powershell variable ` and `use it later`
- we can use the `ConvertFrom-Json along with Select Object` to get the value back from it 

    ```
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
        $new_stud=Get-Content -Path "mydata.json" | Out-String |ConvertFrom-Json |Select-Object *
        Write-Host $new_stud
        Write-Host $new_stud.name
        Write-Host $new_stud.age
    ```

