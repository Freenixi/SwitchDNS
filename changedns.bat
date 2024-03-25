@echo off
cls
echo DNS Switcher
echo ------------
echo Would you like to print all network configurations? (Y/N)
set /p printConfigChoice=
if /I "%printConfigChoice%"=="Y" goto PrintAllConfig
if /I "%printConfigChoice%"=="N" goto ChooseInterface
goto End

:PrintAllConfig
echo Printing all network configurations...
ipconfig /all
echo.
pause
goto ChooseInterface

:ChooseInterface
echo Choose the network interface:
echo 1. Ethernet
echo 2. Wi-Fi
echo 3. Manual enter
set /p interfaceChoice=
if "%interfaceChoice%"=="1" set interfaceName=Ethernet
if "%interfaceChoice%"=="2" set interfaceName=Wi-Fi
if "%interfaceChoice%"=="3" goto ListInterfaces
goto SetDNS

:ListInterfaces
echo Available network interfaces:
netsh interface show interface
echo Enter the interface name from the list above:
set /p interfaceName=
goto SetDNS

:SetDNS
echo Choose the DNS setting:
echo 1. Google DNS
echo 2. Default DNS
echo 3. NOTO DNS
echo 4. Manual enter
set /p dnsChoice=
if "%dnsChoice%"=="1" goto GoogleDNS
if "%dnsChoice%"=="2" goto DefaultDNS
if "%dnsChoice%"=="3" goto NOTODNS
if "%dnsChoice%"=="4" goto ManualDNS
goto End

:GoogleDNS
echo Setting Google DNS...
netsh interface ip set dns "%interfaceName%" static 8.8.8.8 primary
netsh interface ip add dns "%interfaceName%" 8.8.4.4 index=2
goto End

:DefaultDNS
echo Setting DNS to automatic...
netsh interface ip set dns "%interfaceName%" dhcp
goto End

:NOTODNS
echo Setting NOTO DNS...
netsh interface ip set dns "%interfaceName%" static 34.154.40.173 primary
netsh interface ip add dns "%interfaceName%" 34.154.254.177 index=2
goto End

:ManualDNS
echo Enter the primary DNS:
set /p primaryDNS=
echo Enter the secondary DNS (leave blank if none):
set /p secondaryDNS=
netsh interface ip set dns "%interfaceName%" static %primaryDNS% primary
if not "%secondaryDNS%"=="" netsh interface ip add dns "%interfaceName%" %secondaryDNS% index=2
goto End

:End
echo Operation completed.
pause
