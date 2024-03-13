@echo off
set "RegistryPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
set "RegistryName=LocalAccountTokenFilterPolicy"

REM Check if the registry key exists
reg query "%RegistryPath%" /v "%RegistryName%" 2>nul
if %errorlevel% equ 0 (
    REM Delete the registry key if it exists
    reg delete "%RegistryPath%" /v "%RegistryName%" /f
    echo Registry key "%RegistryName%" deleted.
) else (
    echo Registry key "%RegistryName%" not found.
)
