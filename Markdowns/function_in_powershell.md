#### How to Write The PowerShell Function  #####

- A `function` in Powershell Has a  List of `Powershell Statements` that has a Name  that we assigned to it 
- when we `call a function` then the `statement inside the function` will going to be `get running`
- The Syntax of the `function` as below  and  we can call a function just by mentioning the `function` name to it 
    
    ```
        function Say-Hello {
        Write-Host "Hello world!"
        }
        #we can call the function with their name only same as the `Shell Script` in this case
        Say-Hello
    ```
- `using the function` we can `achieve` `reusablity` of our code

#### How to Define  Function  Which Can Take the Arguments 

- we can define the function which take args using the `$args` Array 
- `arguments` are nothing but the `user input` to the function 
- and we can achive those `args` using the `$args` Array by the help of `indexing` as `$args[0]` and `$args[1]`
- while calling we need to `pass the args` but here `we don't have to mention them in the parenthesis`
- here `each args` need to be `separated` by `space` while calling them out

    ```
        # fuinction with Args value
        # function  Wish-Good{
        #     $total=$args[0]+$args[1]
        #     Write-Output $total
        # }
        # #now while calling we can call the function as below
        # Wish-Good 10 20

        #alternate Approach Over Here being Defined 
        # we can also define the function as below as this 
        function Wish-Luck($var1){
            Write-Output $var1
        }
        #while calling we can call them as 
        Wish-Luck 10
    ```


- the `args` can be a `single value` or `collection of values` as well in this case 
- but while defining the function with `args` as the `collection we can mention thenm with parenthesis`

    ```
        #defining the variable which will take $arr1 array as an args
        function Iterate-Array($arr1){
            foreach ($item in $arr1){
                Write-Host $item
            }
        }
        #while calling we can call using it as below 
        $arr1=@("pratik","rika","papali","pupuli")
        Iterate-Array $arr1
        #calling the function over here 

    ```

- we can `pass` both the `Collection` and `Normal Data Type` as the arguments


    ```
        # we can also pass the args as collection and Normal DataType as well 
        function Use-Args($hash1,$val1){
            #using the foreach loop to iterate over multiple keys out in here
            foreach($key in $hash1.keys){
                Write-Host $has1.$key
                #fetching the Value from the HashTable in here 
            }
            #writing the output into the console out in here 
            Write-Output $val1
        }
        #calling the function over here 
        $hash1=@{
            "name" = "pratik";
            "age" = 30 
        }
        $val1= "Hello World! "
        Use-Args $hash1 $val1

    ```


- we can define the `optional params` over here by using the param block `param(<param1>,<param2>)` by providing different parameters
- we can also mention the type in the `param` block as well 
- we can use the `Data Type` to` restict` the `invalid Entry`  and also `type cast` at the same time  in the `param block `
- we can also provide  validation such as `[ValidateSet(<val1>,<val2>)]` and `[ValidateLengthen(<val1>,<val2>)]` and `[ValidateRange(<val1>,<val2>)]` and `[ValidateCount(<val1>,<val2>)]` inside the `param block`

    ```
        # function with param block to specify parameters 
        function Multi-Value(){
            param(
                [Array] $arr,
                [String]$val=0
            )
            foreach ($item in $arr){
                Write-Host $item
            }
            Write-Host $val
        }
        $arr1=@("rika","pratik","papali","pupuli")
        #calling the function over here 
        Multi-Value -arr $arr1 
    ```



- if we are defining the `param block` then we `don't have to pass the args `
- we can `assign a default value` to the args over the `param block` so when `user does not provide the value` then the` default value will going to be considered` 
- this can be `used for those args which are not so much required` 
- in `powershell` function are refered as `method` interchangeably

    ```
    
        #function with params block with validateSet args as below 
        function Use-Validate(){
            param(
                [ValidateSet("n","y")][String]$val,
                [Array]$arr=@{}
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


    ```



#### Important Point for Using Function in Windows PowerShell Function

- in powershell if we don't have any args its optional to give `parenthesis`
- if we have normal parameter then we can define in 3 ways 
  - by using the `$args` Array and accessing it `index`
  - by using the `parenthesis` to define the parameter
  - by using the` param block` without using the args 
- Similarly we have 3 ways to define the Collection parameter as below 
  - by using the `$args` Array and accessing it `index`
  - by using the `parenthesis` to define the parameter
  - by using the` param block` without using the args  


- `[ValidateSet(<val1>,<val2>)]`:- `for the String Value`
- `[ValidateLengthen(<val1>,<val2>)]` :- `for the Array of String`
- `[ValidateRange(<val1>,<val2>)]`:- `for integer value`
- `[ValidateCount(<val1>,<val2>)]` :- `for validate the count opf the Array for both String of Array or int of Array`