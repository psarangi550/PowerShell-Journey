#### How to Iterate Over the Elements in the Collections ####


###### While Loop 

- we can iterate over the collection  by using the `While loop` and `For Loop`
- we can define the while loop as below 
    ```
        $var1=1
        While ($var1  -lt 10 ){
            Write-Output $var1
            $var1+=1
            #we can increment the values by using it as $val1++ as well
        }
        Write-Output 'Finally Outside Code will be Executed'

    ```

##### Do-While -Loop

- in case of the `While loop` if the condition failed the `loop will not be execute once`
- but in case of the `do while loop` the `the code will be executed once` even if the `condition failed`
- as we are `providing the condition at the end` hence it will be execute once even if the` condition being failed `
- the syntax of the `do-while-loop` can be written as below 
-  we can use the `do while loop` as below 

    ```
        $var1=1
        do{
            Write-Output $var1
            $var1+=1
        }while ($var1 -lt 10)
    ```

##### For Loop :-

- `for loop` are mostgly used while iterating over 
- the syntax for the `For-Loop` can be written with as below 
    
    ```
        #usage of the for loop opver here
        for ($var1=1; $var1 -lt 10; $var1+=1){
            Write-Output $var1
        }

    ```

##### How to Use the Loops Over Collections 

- using the `For loop` we can iterate over it as below
  
    ```
        # Loop Usage Over the Collection in Poershell 
        $arr1=@(10,20,30,40,50,60)
        for ($index=0;$index -lt $arr1.count;$index+=1){
            Write-Output $arr1[$index]
        }
    ```

- using the `While-Loop` we can iterate over it as below 

    ```
        # we can use the While Loop to iterate over the Collection as below 
        $arr1=@(10,20,30,40,50,60)
        $index=0
        While($index -lt $arr1.count){
            Write-Host $arr1[$index]
            $index+=1
        }
    ```

- using the `Do-While-Loop` we can iterate over

    ```
        $arr1=@(10,20,30,40,50,60)
        $index=0
        do{
            Write-Output $arr1[$index]
            $index+=1
        }While ($index -lt $arr1.count)

    ```

### Printing the Elements in the reverse order we can use here Any Loop

- using the `For Loop` loop to iterate over the Collection
    
    ```  
        $arr1=@(10,20,30,40,50,60)
        for ($var1=$arr1.count;$var1 -ge 0 ; $var1-=1){
            Write-Host $arr1[$var1]
        }

    ```


#### How to Use the ForEach Loop to Iterate over the coillections

- `foreach` loopp can be used to `iterate over the collections `as below 

    ```
        $collection1=@(10,20,30,40,50,60)
        foreach ($name in $collection1){
            Write-Host $name
        }
    ```


#### How to Use the Loop to Iterate over the HashTable 

- By using the `key` we can iterate over the `HashTable` using the `foreach`loop
- the `$<hash table variable>.keys` will provide all the keys in the `hash table` using that we can access its value 
- 