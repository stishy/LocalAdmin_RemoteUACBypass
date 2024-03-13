﻿$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$RegistryName = "LocalAccountTokenFilterPolicy"
$Value = 1

# Check if the registry key exists
if (-not (Test-Path -Path "$RegistryPath\$RegistryName")) {
    # Create the registry key
    New-ItemProperty -Path $RegistryPath -Name $RegistryName -Value $Value -PropertyType DWORD -Force
} else {
    # If the registry key exists, check its value
    $CurrentValue = (Get-ItemProperty -Path "$RegistryPath" -Name "$RegistryName").$RegistryName
    if ($CurrentValue -ne $Value) {
        # Set the value to the desired value if it's different
        Set-ItemProperty -Path $RegistryPath -Name $RegistryName -Value $Value
    }
}
