# LocalAdmin_RemoteUACBypass
This is a bypass registry key added to the HKLM that allows for local admin accounts to have remote access. This was specifically written to open up wmiexec and crackmapexec for local admin accounts that are harvested or created. The creation and cleanup scripts are included to ensure that you cleanup any hosts that you changed.

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
