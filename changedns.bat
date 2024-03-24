@echo off
cls
echo.
echo DNS Switcher
echo ------------
echo 1. Google DNS
echo 2. Default DNS (Obtain DNS server address automatically)
echo 3. NOTO DNS
echo.
set /p choice=Enter your choice (1-3): 
echo.

if "%choice%"=="1" goto GoogleDNS
if "%choice%"=="2" goto DefaultDNS
if "%choice%"=="3" goto NOTODNS
goto End

:GoogleDNS
echo Setting Google DNS...
netsh interface ip set dns "Ethernet" static 8.8.8.8 primary
netsh interface ip add dns "Ethernet" 8.8.4.4 index=2
goto End

:DefaultDNS
echo Setting DNS to automatic...
netsh interface ip set dns "Ethernet" dhcp
goto End

:NOTODNS
echo Setting NOTO DNS...
netsh interface ip set dns "Ethernet" static 34.154.40.173 primary
netsh interface ip add dns "Ethernet" 34.154.254.177 index=2
goto End

:End
echo Operation completed.
pause
