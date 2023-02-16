#### Custom Function in Powershell  ####

- How to `Set Parameter `for the function
- How to` Accept Parameter for the function` and make Accepting Parameters Mandetory
- How to `Accecpt input to the Pipeline in Powershell`


- we can create the function as below 

    ```
        function create-configuration{
            Write-Output "Create configuration files ...."
        }
        $we can call this function as below 
        create-configuration

    ```

- fi we want to put the `arguments` to the function then that can be done by using the `param block` as below 

    ```
        function Create-Configuration{
        [CmdletBinding()]
        Param(
            [Parameter()]
            [String]$name
            )
            Write-Output "Create configuration files for $name ..."
        }
        #while calling we need to pass the argumnents as below 
        create-configuration -Name "pratik"

    ```

- we can make the `param block as Mandetory` by mentioning it as below 
  
  ```
        function Create-Configuration{
        [CmdletBinding()]
        Param(
            [Parameter(Mandatory)]
            [String]$name
            )
            Write-Output "Create configuration files for $name ..."
        }
        #while calling we need to pass the argumnents as below 
        Create-Configuration -Name "pratik"

  ```

- we can also assign a `default value` to the `parameters` as below while defining the parameters as well 
- but remember while defining the parameters with `default value` we can't make the `Paramter(Mandetory)`

    ```
        function Create-Configuration{
        [CmdletBinding()]
        Param(
            [Parameter(Mandatory)]
            [String]$name="rika"
            )
            Write-Output "Create configuration files for $name ..."
        }
        #while calling we need to pass the argumnents as below 
        Create-Configuration -Name "pratik"


    ```


- But if we want to make the `parameter` as Both `Mandetory and Having a default value then  in that case we can do something like this `

    ```

        #CREATING THE FUNCTION WITH ONE MANDETORY PARAM AND ONE DEFAULT PARAM
        function Create-Configuration{
            [CmdletBinding()]
            Param(
                [Parameter(Mandatory)]
                [String] $name,
                [Parameter()]
                [int32] $age=30
            )
            Write-Output "Your Name is $name and Your Age is $age ..."
        }

        #calling the fubnction in this case
        Create-Configuration -Name "pratik" -age 40

    ```

- we can also use the `[ValidateSer(<val1>,<val2>)]` over here as well

    ```
        #CREATING THE FUNCTION WITH ONE MANDETORY PARAM AND ONE DEFAULT PARAM but eith Valid Data
        function Create-Configuration{
            [CmdletBinding()]
            Param(
                [Parameter(Mandatory)]
                [String] $name,
                [Parameter()]
                [ValidateSet(20,30,40)][int32] $age=30
            )
            Write-Output "Your Name is $name and Your Age is $age ..."
        }
        #calling the fubnction in this case
        Create-Configuration -Name "pratik" -age 50

    ```

- if we have an `array` of `values` which `need to be passed as a pipeline` to the `params args` then we can put the `ValuesFromPipeline` aginst the `Parameter()` block as below
- while taking the values from the` pipeline as the param args` then we can see that the function will be execurted on the `process` block
- we dfo have the `begin` and `end` block which can act the `SetUp` and `tearDown` which will be executed only once
- if we are not using the `process` block then we can see the output only for the `last value` in the `pipeline` where as ignoring the rest of the `input` block

    ```
        function Create-Configuration{
            [CmdletBinding()]
            Param(
                [Parameter(Mandatory,ValueFromPipeline)]
                [String]$name,
                [Parameter()]
                [ValidateSet(20,30,40)][int32]$age=30

            )
            begin{
                Write-Output "Beging Block used as the Setup function only once"
            }
            process{
                Write-Output "The Name of the Person is $name and the Age of the Person is $age"
            }
            end{
                Write-Output "End block will also going to be executed only once as a TearDown function"
            }
        }

        $names=@("pratik","rika","pupouli","papali")
        $names | Create-Configuration -Age 40

    ```