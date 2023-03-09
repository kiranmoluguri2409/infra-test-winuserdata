# Remove HTTP listener
Remove-Item -Path WSMan:\Localhost\listener\listener* -Recurse

Set-Item WSMan:\localhost\MaxTimeoutms 1800000
Set-Item WSMan:\localhost\Service\Auth\Basic $true

$Cert = New-SelfSignedCertificate -CertstoreLocation Cert:\LocalMachine\My -DnsName "ansible"
$ThumbPrint = $Cert.Thumbprint
New-Item -Path WSMan:\LocalHost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint -Force
