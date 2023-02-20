# $all_service=@("VSS","WinRM","TrustedInstaller","Spooler","msiserver")

# #fetching  the Services and Converting them into the HTML format
# $all_service | ForEach-Object {Get-Service -Name "*$_*" | Select-Object -Property $_.Name} | ConvertTo-Html -Property Name,Status,DisplayName -CssUri "myout.css" | Out-File "all_service.html"

# $home_path=Get-Location

# #creating the  selfSignedCertificate Over here
# New-SelfSignedCertificate -CertStoreLocation $home_path -Subject "CN=Test Code Signing" -KeySpec "Signature" `
#  -KeyUsage "DigitalSignature" -FriendlyName "Test Code Signing" `
#  -NotAfter $([datetime]::Now.AddYears(5)) `
#  -CertStoreLocation "Cert:\CurrentUser\My"

#Loading All the CertificaTe for Script Signing 

#  $cert=Get-ChildItem Microsoft.PowerShell.Security\Certificate::LocalMachine\MY -CodeSigningCert

#  Write-Output $cert

New-SelfSignedCertificate -Type CodeSigningCert -CertStoreLocation "Cert:\CurrentUser\My" -Subject "CN=Test Code Signing4" -KeySpec "Signature" `
 -KeyUsage "DigitalSignature" -FriendlyName "Test Code Signing4" `
 -NotAfter $([datetime]::Now.AddYears(5))

$codeCertificate = Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -eq "CN=Test Code Signing4"}

$codeCertificate

Set-AuthenticodeSignature -FilePath C:\Users\psara\Downloads\powershell_sprint_must\Script\automation_report.ps1 -Certificate $codeCertificate 


# Write-Host "Hello"

# SIG # Begin signature block
# MIIFdgYJKoZIhvcNAQcCoIIFZzCCBWMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUev1YIhOEf8ksWmAem0eEUpGQ
# u5agggMOMIIDCjCCAfKgAwIBAgIQHmluMw/U5KhIxeOml2ejYTANBgkqhkiG9w0B
# AQUFADAdMRswGQYDVQQDDBJUZXN0IENvZGUgU2lnbmluZzQwHhcNMjMwMjE5MDk0
# MjE0WhcNMjgwMjE5MDk1MjE0WjAdMRswGQYDVQQDDBJUZXN0IENvZGUgU2lnbmlu
# ZzQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCgCDc8taDPZzZ3khHd
# 4AF6WCytY4vqYRtiSJ9mPrm7stRRmkjfhKC0hNYMhtzwg5VOMO8CQLRavMZsukW2
# 7ofoDmbfzuD7znfsYcaeFYq8B2KPX0c17FG7KCyROoG59+Q4TGoeI7BpOnFs/SU3
# LPq4MfaRMVBED2I366muFb1i8LN9uRS4YPJA8sc0mJX+cxanAA53//vURmx7Amyq
# +ohJV0Z9URB/KUmlQJPrLMqaOCn9CpIx+2W4EeY7huJLOf9g7eNZlUqjJACXMpo3
# L8+MWNeZKtjrcxncHXL7HmEjaNAyz2/5UWQa+tlfiLxAye6K0ve4uoQz1Om+oyPt
# Q+7FAgMBAAGjRjBEMA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcD
# AzAdBgNVHQ4EFgQUrWGsAEt7oe9OwAI0isMjBFMuFxUwDQYJKoZIhvcNAQEFBQAD
# ggEBAAPPOmSaMbOaTncclPCvy+G8Go+4zPh73oOWd14lOwIs5HY6CVWsJgNCFo4v
# H/AEesxQPGPb0FGn0EYYHnMuAsHOuaKw8ev7JxQeFaI2qQPhZZqzf5dIAffXQxMG
# k8+WmUiYV8Pmwiqesxd2mBNX8B3fxcQSpQ4lbeoLbCO98URS1KYEV1yr5LxzZtRn
# u8SNLIfxGyk1rW8kkdBK6p/50p/1tpVSdXzxbhq4wmWMtdXNTcRAMhjMLT9Sk1Tf
# UEDC1HGwMdGfatF9p2pJRRJr6+ym1HW5C5NVH+6sSoJzxosjaC1tBdqVWff/aiQR
# P3T+IDPc/N7uNfTFgioveZY+ovYxggHSMIIBzgIBATAxMB0xGzAZBgNVBAMMElRl
# c3QgQ29kZSBTaWduaW5nNAIQHmluMw/U5KhIxeOml2ejYTAJBgUrDgMCGgUAoHgw
# GAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGC
# NwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQx
# FgQU+QJDQ4Bb1UNrvKCdV+84rrT7f/AwDQYJKoZIhvcNAQEBBQAEggEAJwEsPIrF
# viq95xhNFj1ssSz/cLZzVrrMW8b5uuLDwGqCrrfQhONnh6ErNUKTnohyuhFgIshA
# sJ1E3jMi6GFnaDU3TlkvSeqzmeOkVbrAWtsrLUS8ryCC/lMihP6JAVLOsFUmw98M
# OAYIvIP1fchruP0XRLaprYemGh/ksPLI/bTumkGogSq/C3qIQtMCU1Xpw+yAZ1Ev
# hwRvR2qEvDop9zezmRZimbhiR3HD7uWSk++DO77WGMcsF9YctGF73eAVyV/tgECd
# MIiNMtP04sE06FiVOF+M3hekiu3px9EyJQw1BkWj0vTYZNHdtXiEMLFOhBwNPTVK
# lmTyoMJkuvYkLQ==
# SIG # End signature block
