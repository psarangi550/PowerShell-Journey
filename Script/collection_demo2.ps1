[hashtable]$hash1=@{
    "person1" = @{"name"="pratik";"age"=30};
    "person2" = @{"name"="rika";"age"=25}
}
Write-Output $hash1
Write-Output $hash1.person1
Write-Output $hash1["person1"]