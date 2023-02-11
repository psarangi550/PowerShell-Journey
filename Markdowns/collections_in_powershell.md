#### Powershell collections


- variables can only store `one value` at a time 
- `collection` is nothing but an object `that group multiple elements orobjects into a single unit`
- There are couple of `Collections object` available in `powershell` and those are  of
  - Array
  - Arraylist
  - HashTable etc


###### Array

- Array is Data Structure which can be used to store a `collection of items` which are of` different type or same type`
- Each object in the array have an index number which starts from `0 to n-1`
- we can represent the array by `putting Element together separated by comma` i.e `$a=10,20,30`
- now if we check the `Get-Type()` to validate the type then it will be of as below 
  
  ```
        #this will store the $arr1 as an array
        $arr1=10,20,30,40
        #verify the type of the same by using it as $arr1.Get-Type()
        $var1=$arr1.GetType()
        #here we will get the output as System.Object[] and BaseTpe of System.Array
  ```

- we can also create the Array by using it a `@(<value1>,<value2>....)`
- we can create the Attay of string as below 
  
  ```
        $arr1=@("pratik","rika","abi")
        #creating the array with the values as System.String 
        Write-Host $arr1
        #while showing the data comma will be turned to spaces in this case
  ```

- we can  see all different properties and method available for the `Array` DataStructure then we can see that by using it as below 
    
    ```
        #fetching the array with the values as System.String
        [Array]$arr3=@("pratik","rika")
        #now we can see its properties as below 
        Write-Output $arr3 | Get-Member

    ```


- we can use $data.GetUpperBound(0) to get the max index number.
  
  ```
        $data = 'Zero','One','Two','Three'
        Write-Output $data.GetUpperBound(0)
        #this will return the Last Index Number over here
        #we can also access by using the $data[-1]
        #we can also get by using 
        $data[$data.count -1] 

  ```

- We can use the same index to update existing items in the array. This gives us direct access to update individual items.

  ```
      $data = 'Zero','One','Two','Three'
      $data[2] = 'dos'
      $data[3] = 'tres'
      #but if we want to fetch the index which does not exist then we will get and Erroe
      $data[4] = 'four'# Index was outside the bounds of the array.


  ```

- In most languages, you can only specify a single number as the index and you will get a single item back. PowerShell is much more flexible. You can use multiple indexes at once. By providing a list of indexes, we can select several items.

  ```
      #DEFINING THE ARRAY OUT IN HERE 
      $data = 'Zero','One','Two','Three'
      #fetching multiple values out of it 
      $data[0,2,3]

  ```
- The items will be returned based on the order of the indexes provided. If you duplicate an index, you will get that item both times
- You can use `negitive index` values to` offset from the end`. So if `you need the last item in the list, you can use -1`.
- One word of caution here with the .. operator. The sequence 0..-1 and -1..0 evaluate to the values 0,-1 and -1,0. It’s easy to see $data[0..-1] and think it would enumerate all items if you forget this detail. $data[0..-1] gives you the same value as $data[0,-1] by giving you the first and last item in the array (and none of the other values).

- In most languages,` if you try to access an index of an item that is past the end of the array, you would get some type of error or an exception`. `PowerShell will silently give you nothing`.

    ```
        PS> $null -eq $data[9000]
        True
    ```

- `If your variable is $null and you try to index it like an array`, you will get a `System.Management.Automation.RuntimeException` exception with the message Cannot index into a null array.

  ```
     PS> $empty = $null
    SP> $empty[0]
    Error: Cannot index into a null array.

  ```

- PowerShell 3.0 added a count property to most objects. you can have a single object and it should give you a count of 1.

  ```
      PS> $date = Get-Date
      PS> $date.count
      1

  ```

- Even $null has a count property except it returns 0.
  
  ```

    PS> $null.count
    0

  ```

- if we wan to fetch the Maximux Value from the Array Object we can use it as with below 

  ```
      # we can use the Major-Object to fetch the Maximux Value of the Array in here 
      #here we can use the -Max flag to fetch the Maximux Value from an Array
      $MAX= ($arr1 | Measure-Object -Max).Maximum
      Write-Object $MAX #this will display the Maximum value

  ```

- if we want to fetch the minimumn value we can use the Major-Object as well in here 

  ``` 
      $arr1=@(200,343,4,23,42,3,42,99,100)
      $var1=($arr1 | Measure-Object -Min).Minimum
      Write-Host $var1

  ```
- we can get the index of the array where we get the maximum and minimum value then we can use it as 
  
  ```
    $arr1=@(200,343,4,23,42,3,42,99,100)
    #defining the Array in here 
    $var1=($arr1 | Measure-Object -Max).Maximum
    #here we can use the [Array] object to calculate where the Maximux value present as 
    Write-Host $var1
    $index_of_max=[array]::IndexOf($arr1,[int]$var1)
    #this will provide the index of the Max Value
    Write-Host $index_of_max

  ```

- we can use the `Sort-Object` to sort an Array with the Help of `|` symbol as below 

  ```
      $arr1=@(200,343,4,23,42,3,100)
      $val1=$arr1| Sort-Object -Descending
      #now we can write the output as below 
      Write-Host $val1
      #by default we can Sort it by Ascending as 
      $val1=$arr1| Sort-Object
      #now we can write the output as below 
      Write-Host $val1
      
  ```

###### Properties and Method in reference to the Array DataStructure

- Length  &rarr; this will be used as `$<array variable>.Length` property 
- we can access the index of the Array by using it as `$<array variable>[<index number>]`
- we can also subscript the array by using it as `$<array variable>.[<start>..<end>]`
- we can add the array element as `$<array variable 1>+$<array variable 2>`
- we can check whether an element present in an array b y using it as `$<array variable>.contains(<element>)` which return `True/False` as an return value which can be used in `if-else`
- we can also check the index of a particular element  by using the `$<array variable>.IndexOf(<element>)`, if the element not found then return `-1` as output
- we can see the array is of `Fixed Size` or not by using it as `$<array variable>.isFixedSize` which return the Value in` True/False` format 
- by default when we create the array by using `@(<val1>,<val2>)` hence the `Array` is of fixed Size
- hence we can't perform action such as `Add()` on then , we will end up `getting an error for the same` 
- hence this Array is `immutable` in nature ` can't change it size and if we try to change then with that new array object will be created`
- if we really want to add elements to the array then we can create another array with element that we want to add and add both the array which will create another Array in here
- Array` will take up memory` `until the program been executed` 


###### ArrayList

- ArrayList is an array which is `mutable` in nature so its `length can be dynamically be changes` 
- we can do `modify,search,remove` element from  an  A`rrayList`
- in order to Create the ArrayList we can use class of  `System.Collections.ArrayList`
- we can create the ArrayList as below `[ArrayList]$arr1=New-Object System.Collections.ArrayList` which will create an `empty ArrayList`
- we can add elements to the `ArrayList` by using the `Add()` as `$<arr list variable>.Add("element")`
- we can add range of elements to the `ArrayList` by using the `AddRange()` as `$<arr list variable>.AddRange(<element1>,<element2></element2>)`
- we can see the Properties available we can use the command as `$<arr list variable> | Get-Member`


##### Important Points into Array And ArrayList

  - Both `Array and ArrayList` store the value in an particular index which is an `integer value in increasing number`
  - while `Iterating and searching` thee search being from `first index to Last index` which is very in-efficient 
  - while searching the `Array and ArrayList` are recomended to use and also while `sorting` its `not recomended to use`
  -  Both `Array and ArrayList` `allow duplicates` by default 
  -  but if we want the` unique value` only then its not recomended to use


###### HashTables

- HashTable Stores the value in `key-value` format which can be considered as `dictionary` in other programing Language
- it can store the values with `key-value` pair
- we can define the `HashTable` as `@{}` symbol 
- we can define the `hashTable` with elements as below 
    
    ```
        $dict1=@{
            "name"="pratik",
            "roll"=101,
            "Sex"="male"
        }


    ```

- in the `HashTable` the `key` must be of `unique` in nature , but value can be duplicated
- we can see the `properties` of the `HashTable` we can use it as `$<HashTable variable>|Get-Member`
- we can see the `element` in the `HashTable` then we can use it as `$<HashTable variable>.count`
- we can see the `keys` in the `HashTable` then we can use it as `$<HashTable variable>.keys`
- for fetching the different values then we can use it as `$<HashTable variable>.values`
- we can access the values using the `.` operator as `$<HashTable variable>.<key-value>`
- we can also use the `[]` operator for the same as well `$<HashTable variable>[<key>]`


- we can see if a `HashTable` is of FixedSize or Not by using the comnmand as `<HashTable>.isFixedSize` which will return a `boolean value` as outcome
- the `HashTable` is not of `Fixed Size` variable in this case hence the `return value` wi;; be of `False`
- we can use the `Add()` on the `<HashTable Variable>` as `$<HashTable Variable>.Add("key", "value")` to add an key-value pair to the `HashTable`
- we can't add `duplicate key` while using the `Add()` on the `<HashTable Variable>`
- we can also remove a `key-value pair` from the `HashTable` as `$<HashTable Variable>.Remove(<key>)` if the `key` present the value will be removed in here


- if we want to add the `ordered HashTable` then we can do that as `[hashtable]$hashtb1=[ordered]@{<key>=<value>}`
- here we can add the `HashTable` inside anoither `HashTable` as below 
- here in case of `HashTable` the `;` comes as the `delimeter`

    ```
        [hashtable]$hash1=@{
        "person1" = @{"name"="pratik";"age"=30};
        "person2" = @{"name"="rika";"age"=25}
        }
        Write-Output $hash1
        #using the `.` operatoir to get the values with key
        Write-Output $hash1.person1
        #using the `[]` operatoir to get the values with key but here the key need to be a string
        Write-Output $hash1["person1"]

    ```

- we can `Add and Remove` element on the fly using the `HashTable`
- `searching and sorting` will be really helpful in case of the `HashTable`
- we can see the details about the `Array/ArrayList/HashTable` by using the `Get-Help` command as belo0w 
  -` Get-Help about_Array -ShowWindow` or `Get-Help about_Array_List -ShowWindow` or ` Get-Help about_Hash_Table -ShowWindow`


  ```
        $key = 'Kevin'
        $value = 36
        $ageList.add( $key, $value )
        $ageList.add( 'Alex', 9 )

  ```

We can use this approach to add or update values into the hashtable too. This is just like using the add() function above.

  ```

    $ageList = @{}
    $key = 'Kevin'
    $value = 36
    $ageList[$key] = $value
    $ageList['Alex'] = 9

  ```
- Generally, you think of a hashtable as a key/value pair where you provide one key and get one value. PowerShell allows you to provide an array of keys to get multiple values.

  ```
      #here the Checking  for the HashTable collection
      $environment=@{
          Prod = 'SrvProd05'
          QA   = 'SrvQA02'
          Dev  = 'SrvDev12'
      }
      #we can also use the List to fetch multiple value from the HashTable
      $multi_servwer=$environment[@("Prod","QA")]
      # now we can access the value of that as 
      Write-Output $multi_servwer
  ```
- we can access rthe `property of the HashTable ` by using it as below 
- The use of property based access changes the dynamics of hashtables and how you can use them in Powershell. Here is our usual example from above treating the keys as properties.
  
  ```
    $ageList.Kevin = 35
    $ageList.Alex = 9

  ```
- if the `Key` provided while accessing using the `.` operator then it will add that to the `HashTable`
- we can add and access attributes on the $person like this.

  ```
      $person = @{
      name = 'Kevin'
      age  = 36
      }
      $person.city = 'Austin'
      $person.state = 'TX'


  ```

- You can remove keys with the .Remove() function. as below `$person.remove('age')`
- Assigning them a $null value just leaves you with a key that has a $null value.
- A common way to clear a hahstable is to just initalize it to an empty hashtable. `$person=@{}`
- While that does work, try to use the clear() function instead. which can be used as `$person.clear()`


- When you are defining a hashtable on one line, you can separate the key/value pairs with a semicolon.
  
  ```
      $person = @{ name = 'kevin'; age = 36; }
  ```

##### important Operation in reference to Powershell

- to do a florr division we can use it as `[Math]::Floor($var)`
- for doing the round of a number we can use it as `[Math]::Round($var)`
- for fetching the  ceiling value we can use it as `[Math]::Ceiling($var)`
- 