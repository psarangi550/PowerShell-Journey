$smtp_server = "smtp.gmail.com"
$smtp_port="587"
$username="pratik.flask@gmail.com"
$pass="pkcgqjefpcchhkyj"
$To="pratik.flask@gmail.com"
$cc="pratik.flask@gmail.com"
$from="pratik.flask@gmail.com"

# reading the Data From the Service
$all_service=@("VSS","WinRM","TrustedInstaller","Spooler","msiserver")

#fetching  the Services and Converting them into the HTML format
$all_service | ForEach-Object {Get-Service -Name "*$_*" | Select-Object -Property $_.Name} | ConvertTo-Html -Property Name,Status,DisplayName -CssUri "myout.css" | Out-File "all_service.html"

$html_path="all_service.html"

$Subject="This is Subject Test Subject"
$Body= Get-Content -Path $html_path

$message= New-Object System.Net.Mail.MailMessage
$message.IsBodyHtml=$true
$message.Body=$Body
$message.Subject=$Subject
$message.to.add($To)
$message.CC.add($cc)
$message.from=$from


$message
$smtp = New-Object System.Net.Mail.SmtpClient($smtp_server, $smtp_port);
$smtp.EnableSSL=$true
$smtp.Credentials=New-Object System.Net.NetworkCredential($username,$pass);
$smtp.send($message)





