#### How to Use the Powershell Logs ####

- we can start the Transcript using the `Start-Transcipt` command
- we can ping to a location using it as `Test-Connection <url name>` to check the connection
- we can also use the `ping <url>` which is `cmd command` as its compatible with powershell it will work too
- when we want to stop the transcipt then we can run the command as `Stop-TransScript`
- When we use the `Stop-TransScript` then by default its been saved to the `Documents` folder
- if we have logged in as some-other user and  then changes to `Administrator` then it will show all the `information` of that as well 
- we can use the `-Path` to `Provide an Path` to the transciprtion
- we can use the `-Append	Append content to an existing file`
- we can use the `IncludeInvocationHeader` to `Add the timestamp to a command in the log file`
- we can use the `-UseMinimalHeader` to `Prepend a short header instead of the full header (PS6+)`
- we can use the `-OutputDirectory` and `Specify the output directory (filename will be created automatically)`