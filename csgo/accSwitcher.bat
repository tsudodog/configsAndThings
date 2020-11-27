@echo off

TITLE Select Steam account

taskkill.exe /F /IM steam.exe

cls
echo(
echo(
echo(
echo                                      Select your account
echo                            =======================================
echo(
echo 1) "Replace with a name you want to see in the window for your first account, e.g. Main"
echo 2) "Replace with a name you want to see in the window for your second account, e.g. Second"
echo(

CHOICE /M Select /C 12

If Errorlevel 2 Goto 2
If Errorlevel 1 Goto 1

:2
set username="Replace with your second account username"
Goto end
:1
set username="Replace with your first account username"
Goto end

:end

reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main

exit
