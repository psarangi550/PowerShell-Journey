
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

