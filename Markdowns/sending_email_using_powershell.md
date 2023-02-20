#### How To Send Email Using Powershell ####

- In Order to send email we need the access to the `SMTP Server`
- once we send the email then it go to the `Sender SMTP Sevice Provider` Server with the info as `To/CC/Subject/Body/Attachment`
- From the `Sender SMTP Sevice Provider` it will travel to the `Receiver SMTP Sevice Provider` then will reach to the  `Receiver Email`
- while delivering the `email` from  `Sender SMTP Sevice Provider` to `Receiver SMTP Sevice Provider` it will be marked as `Normal Email or Spam`
- `SMTP` stands for `Simple Mail Transfer Protocol`


##### How to Use GMAIL SMTP Server to send the email #####

- we need to use the GMAIL SMTP server address as `smtp.gmail.com`
- we also need to use the GMAIL SMTP  Port which is of port `587`
- But on our gmail `goto ---> gmail settings ---> Forwarding POP/IMAP---->Enable  Enable POP for all email ---->Enable Pop for mail that arrives from now `
- we need to make sure also `Imap Also enabled`
- we also need to provide the 
  - `username` from where we are sending the email which will be the `email` of the `user`
  - `password` from where we are sending the email
  - `To Address` Recipient to which we are sending the email to
  - `cc Address` Recipient to which we are sending the email to
  - we can provide the `Subject and Body` of the email as well

- Here we need to create a object by using  `New Object` of the class `System.Net.Mail.MailMessage` with that object we can send the email
- we can see the different `methods` and `properties`  of the `message object` as `$<object of System.Net.Mail.MailMessage>` as `$<object of System.Net.Mail.MailMessage>| Get-Member` or `System.Net.Mail.MailMessage |gm`
- we can assign the `Subject` variable that we have created to the `$<object of Sysytem.Net.Mail.MailMessage class>.subject=$<Subject Variable>`
- we can assign the `Body` variable that we have created to the `$<object of Sysytem.Net.Mail.MailMessage class>.body=$<Body Variable >`
- we can assign the `To` variable that we have created to the `$<object of Sysytem.Net.Mail.MailMessage class>.to.add($<variable that we have created for the To Address>)`
- we can assign the `CC` variable that we have created to the `$<object of Sysytem.Net.Mail.MailMessage class>.cc.add($<variable that we have created for the To Address>)`
- we can assign the `username` variable that we have created to the `$<object of Sysytem.Net.Mail.MailMessage class>.from=$<username variable>`
- we can mention multiple email address as for the `To` and `CC` and `Attachments` which been mentioned as `{}` while we do `$<object of System.Net.Mail.MailMessage> | gm`


- Now once the `System.Net.Mail.MailMessage` object being ready now we can set the `smtp client` as below
- we have to create the class of the `System.Net.Mail.StmpClient($<smtp Server variable>,$<smtp port variable>)`
- for gmail we can create it as `System.Net.Mail.StmpClient($<smtp_server_var,$smtp_port_var)`
- if we are using the `port` as `587` then we must have to configure as `$<smtp client obj>.EnableSSL=$true`
- similarly we can set the  credetional as `Network Credetional Object` as below for the `$<smtp client obj>.Credetional`
- we can create that as `$<smtp client object>.Credetional=New-Object System.Net.NetworkCredetional($<username>,$<password>)`
- we can use the `send` method on the `$<smtp client object>` which take the `Object of System.Net.Mail.MailMessage` as an args
- so we can write that as `$<smtp client obj>.send($<object of sysyem.Net.Mail.Message>)`


- we can also add the `Body` as the `Html` File object that will be created 
- if we have an Html Body to send then we can use the `$<object of System.Net.Mail.MailMessage>.IsBodyHtml=$true`
