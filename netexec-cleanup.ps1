$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$RegistryName = "LocalAccountTokenFilterPolicy"

# Check if the registry key exists
if (Test-Path -Path "$RegistryPath\$RegistryName") {
    # Delete the registry key if it exists
    Remove-Item -Path "$RegistryPath\$RegistryName" -Force
    Write-Host "Registry key '$RegistryName' deleted."
} else {
    Write-Host "Registry key '$RegistryName' not found."
}