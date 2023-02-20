#### How to Secure Powershell Script by using Script Signing ####

- In the default Powershell Script we can see some of the Script have Signature with `random character`
- Here we will learn about below things
  - what is a Script Signature
  - How to Obtain a Script Signature
  - How to use it to improve the Script Signing
- if we want to see the `current execution level on the powershell script ` we can do that by using it as `Get-ExecutionPolicy` cmdlet will help in here
- on the `Powershell` if we want to know the `execution level` then that we can see by using the `Get-ExecutionPolicy` cmdlet
  - The execution Policy can be of `Unrestricted` which is of Highly Insecure  in nature not advisiable for the `Production environment`
  - The ExecutionPolicy as `AllSigned` which will allow all the `Powershell command` as they have a `Script Signature` but` not to those script` which does not have a `Script Signature`
  - The Execution Policy can also be set to `RemoteSigned` and `ByPass` as well

- we can se the execution Policy as `Set-ExecutionPolicy` cmdlet with the `required` policy that we have set by using it as `Set-ExecutionPolicy <policy name>`


#### How to Create a Signed Script in Powershell ####

- for creating the `Script Signature` we need a `Certificate`
- for creating the `Certificate` we can use as `New-SelfSignedCertificate` cmdlet
- we can also provide the `-Type` as `custom`/`CodeSigningCert` while creating the Certificate 
- we can also provide an `-Subject` flag to provide the `Subject` while creating the certificate which takes a `String as an argument`
- we also have to provide the `-KeySpec` which takes an `String as an argument`
- we also have to provide the `KeyUsage` which takes the `String as an argument` which should be dedicated to `"DigitalSignature"`
- we need to provide the `-FriendlyName` as `String as an argument`
- we have to provide the `Certificates-expiry` which can be defined with `NotAfter` cmdlet
- the `NotAfter` cmdlet takes an `$([datatime]::now.AddYears(5))` which can mention the `time` as `5 Years from now`
- for that we have to use it as `New-SelfSignedCertificate -Subject`
- we can also mention the `-KeyAlgorithm` as `EDCSA_nistP256`
-  we can even mention the `-CertStoreLocation` and the location can be provided as `cert:\CurrentUser\My`


##### Whats the Default Place for the Certification ######

- we can see the `certificate` we created using the `New-SelfSignedCertificate` cmdlet can be found in `%AppData%\Microsoft\SystemCertificates\My\Certificates` foe windows 7
- for Higher Version of certificate we can found that in the `New-SelfSignedCertificate` we can create it in as 
    `New-SelfSignedCert -Type Custom -Subject "<subject name>" -KeySpec "<string>" -KeyUsage "<string>" -KeyAlgorithm "EDCSA_nistP256" -FriendlyName "<string>" -CertStoreLocation "cert:\CurrentUser\My"`
- we can get the certificates in the `Certificate Manager` &rarr; `Personal` &rarr; `My` profile we will be able to see the info
- this `certificates` contains the `cryptographic algorithms` which can help in getting the `Script Signature`
- we can see the `Help` section of the same buy using the command as `Get-Help/Help New-SelfSignedCertificate -ShowWindow`


##### How to Load the Certificate That we Created into the Script to Make it More Secure #####

- we can use the command as `CodeSigningCert` cmdlet for that usage
- we can use the `dir` cmdlet which is short for `Get-ChildItem` cmdlet to load all the `certificates`  in the location of `cert:\CurrentUser\My` which we accessed using the `Certificate Manager`
- we can also sendit to the dedicated location using the `-CertStoreLocation` flag as `cert:\AllLocation\My` and which can help in fertch it from there
- we can use it as `$cert=(Get-ChildItem/dir Cert:\LocalMachine\My | Where-Object {$.Subject -eq "Subject Name"})` to fetch the certificate from the desired `CertStoreLocation`
- we can see all it attribut by using it as `$cert | Get-Member` and we can also able to see all the available option by using ther command as `$cert | Select-Object *`
- the `$cert` cariable that we get is an object of `System.Security.Cryptography.X509Certificates.X509Certificate2` class 
- Now in order to load the certificate we can use the command as below 

- By using the `Set-AuthenticodeSignature` command we can load the certificate and create the Script Signature from their for our Powershell script

  ```
        Set-AuthenticodeSignature -Filepath <location to the powershell script> -Certificate $<certificate variable we get by using the Get-ChildItem/dir Cert:\LocalMachine\My |               Where-Object      {$.Subject -eq "Subject Name"}>
  ```

- The above command will create a `Signed Signature` using which in Powershell we can execute the code
- But even now if we try to execute the script then also we will end up getting error because the `Script Signature` is there but thats not authorized by the `Trusted Publisher`
- in order to signed by the `Trusted-Publisher` we can use the below Steps to add that the `Trusted certificate List`
- we can add that by using the `Win+%--->mmc.exe` which will open the `certificate manager` with the `root access`
- we can then go to `file-->Add or Remove Snap in` &rarr; `select Certificate` &rarr; `push from left to right` &rarr;`Which will display the certificate window`
- then we need to go for ` Trusted certificate-->Certificate--->Add Files --->Import certificate ---> Import the certificate from the location as %AppData%\Microsoft\SystemCertificates\My\Certificates and select the optioin as AllSigned`
- once done then the `Certificate Import was successfull` and `Also we have added our Script to the Trusted Certificate`
- now we can change the `Execution Policy` by using `Set-ExecutionPolicy AllSigned`
- now when we execute the `Script` it will going to be executed, but as its already signed we can't be able to amend the Script as its already Signed by using the Trusted User


#### How to Export A Trusted Certificate in Certificate Manager ####

- we can go to the `Trusted Certificate-->Certificate--->Locate Certificate -->Next--->son't export the Private Key --->Select Der(.cer)--->Select the Location and provide a name to the certificate --->Next--->Finish`
- here we will hget the certificate in the location as `<filename we provided during export>.cer` files