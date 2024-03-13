@echo off
set RegistryPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
set RegistryName=LocalAccountTokenFilterPolicy
set DesiredValue=1

rem Check if the registry key exists
reg query "%RegistryPath%" /v "%RegistryName%" >nul 2>&1
if %errorlevel% neq 0 (
    rem Create the registry key if it doesn't exist
    reg add "%RegistryPath%" /v "%RegistryName%" /t REG_DWORD /d %DesiredValue% /f
) else (
    rem If the registry key exists, check its value
    reg query "%RegistryPath%" /v "%RegistryName%" | findstr /i /c:"%RegistryName%" >nul
    if %errorlevel% equ 0 (
        rem Check if the value is different from the desired value
        for /f "tokens=3" %%i in ('reg query "%RegistryPath%" /v "%RegistryName%" ^| findstr /i /c:"%RegistryName%"') do (
            if "%%i" neq "%DesiredValue%" (
                rem Set the value to the desired value if it's different
                reg add "%RegistryPath%" /v "%RegistryName%" /t REG_DWORD /d %DesiredValue% /f
            )
        )
    )
)
