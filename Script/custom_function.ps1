# function Create-Configuration{
#     [CmdletBinding()]
#     Param(
#         [Parameter()]
#         [String]$name
#     )
#     Write-Output "Create configuration files for $name ..."
    
    
# }
# #while calling we need to pass the argumnents as below 
# create-configuration -Name "pratik"


#making the param block manetory as below

# function Create-Configuration{
#     [CmdletBinding()]
#     Param(
#         [Parameter()]
#         [String]$name="rika"
#         )
#         Write-Output "Create configuration files for $name ..."
#     }
# #while calling we need to pass the argumnents as below 
# Create-Configuration


#CREATING THE FUNCTION WITH ONE MANDETORY PARAM AND ONE DEFAULT PARAM
# function Create-Configuration{
#     [CmdletBinding()]
#     Param(
#         [Parameter(Mandatory)]
#         [String] $name,
#         [Parameter()]
#         [int32] $age=30
#     )
#     Write-Output "Your Name is $name and Your Age is $age ..."
# }

# #calling the fubnction in this case
# Create-Configuration -Name "pratik" -age 40


#CREATING THE FUNCTION WITH ONE MANDETORY PARAM AND ONE DEFAULT PARAM but eith Valid Data
# function Create-Configuration{
#     [CmdletBinding()]
#     Param(
#         [Parameter(Mandatory)]
#         [String] $name,
#         [Parameter()]
#         [ValidateSet(20,30,40)][int32] $age=30
#     )
#     Write-Output "Your Name is $name and Your Age is $age ..."
# }

# #calling the fubnction in this case
# Create-Configuration -Name "pratik" -age 50


# using the values from the array-pipeline and passing it into the function as below 

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
