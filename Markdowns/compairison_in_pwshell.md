#### How to Use Compairsion in Powershell

- whenever the compairison happended Successfully then we will get the output as `True` else we will get the output as `False`
- we can use the compare as the below `-eq` whether the 2 values are equal
- by default the `-eq` compairision operator is `case insensitive` hence if  if we want the `case-sensitive` then we can use it as `-ceq` which will be helpful to compare string values 
- Mostly the `case insensitive` operator starts with `c` by default 
- we can also use the `-ne/-lt/-ge/-gt` as well for  operator used for comparison


- but we campare multiple values to a single value as well  for that we can use it as below 
    ```
        7,8,9 -lt 8 # this will provide the 7 as the ans as it satisfies the answer instead of  True or False Value
        7,8,9 -le 8 # this will provide the 7,8 as it satisfies the answer both senarios
    ```

- we do have the `like` operator to `match the string values ` gives an output based on that , here we can provide regular expression in order for the compairsion 
- same as `-eq and -ceq` we can use the `like` operator as well by using the `clike and like`
- same as `like` we can use the `notlike`  operator as well 
- by using this we can compare the `substring and string`
- we can use the wildcard as `*`  while performing the wildcard compairsion
- and whether we are using the `like/notlike/clike/cnotlike` operator for the `*` i.e  the `cases will be ignorred `


- we can use the `-like` operator to see the value been matching or not  for multiple string as well 
- by using `@()` we can `define mutiple string `where as `@""/@''` used for spcifying the `multiple line of the string` 
- when we compare the multiple string in reference to the  string which are the matched term then in that case instead of returning as True or False it return which value been matching 
- this concept is same as `-lt/-le/-gt/-ge` values 
- so we can compare multiple values  as below 
    
    ```
        @('This is the First Value',
        'This is the Second Value',
        'This is the Third Value'
        ) -lke 'Third'
        #here in this case we will get the value as output as This is the Third Value

    ```

- here we can also use the `-match` which will matches the string using the `regex`
- same as match we have `-cmatch` which will ignore the cases while comparing the string with their defined regular expression
- after compairison the `-match` operator save the result inot the `$matches` variable 
- we can access the match value using it as `$matches[0]`
- this `$matches` will only be available for string matching not for any other data-type


- we can use the `-contains` operator to match  a `string being present in the collection of string or not` 
- The main difference betwen the `-like/-clike/-notlike/-cnotlike`operator is to compare the `indivisual string  agsinst the substring`
- when compare the `indivisula string` the `-like/-clike/-notlike/-cnotlike`operator return True/False but `when compare with multiple one return the String is matching`
- when we compare the `-contains` with mutiple values then in that case we will get the outcome as `True/False`
- we have to use `conrtains` then we can't provide wildcard while compairing
- but we can provide wilcard while comparing with `-like/-clike/-notlike/-cnotlike`

    ```
        @('This is the First Value',
        'This is the Second Value',
        'This is the Third Value'
        ) -contains 'Third'
        #this will provide an response of True and False instead of stating which values are matcvhing or not

    ```

- we can use the statemnent  with `notcontains` in the similar fashion of how we use the `contains` operator 
- we can use the `Get-Help about_compairsion_operator -ShowWindow` to see all list of compairion operator
- 