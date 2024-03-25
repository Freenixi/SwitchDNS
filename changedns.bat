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
echo 1. Google DNS - Speed and security.
echo 2. Default DNS - Your ISP's default setting.
echo 3. NOTO DNS - Surf Web3 Domains.
echo 4. Cloudflare - Speed, privacy with no logging.
echo 5. Quad9 - Protection and privacy.
echo 6. AdGuard DNS - Anti advertisement.
echo 7. YandexFamily - Antivirus, fraudulent and adult content filtering.
echo 8. CleanBrowsing - Family Mode - Filters out adult content.
echo 9. OpenDNS - FamilyShield - Pre-configured to block adult websites.
echo 10. Custom - Add manually your desired DNS.
set /p dnsChoice=
if "%dnsChoice%"=="1" goto GoogleDNS
if "%dnsChoice%"=="2" goto DefaultDNS
if "%dnsChoice%"=="3" goto NOTODNS
if "%dnsChoice%"=="4" goto Cloudflare
if "%dnsChoice%"=="5" goto Quad9
if "%dnsChoice%"=="6" goto AdGuardDNS
if "%dnsChoice%"=="7" goto YandexFamily
if "%dnsChoice%"=="8" goto CleanBrowsing
if "%dnsChoice%"=="9" goto OpenDNSFamilyShield
if "%dnsChoice%"=="10" goto Custom
goto End

:GoogleDNS
echo Setting Google DNS...
netsh interface ip set dns "%interfaceName%" static 8.8.8.8 primary
netsh interface ip add dns "%interfaceName%" 8.8.4.4 index=2
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:DefaultDNS
echo Setting DNS to automatic...
netsh interface ip set dns "%interfaceName%" dhcp
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:NOTODNS
echo Setting NOTO DNS...
netsh interface ip set dns "%interfaceName%" static 34.154.40.173 primary
netsh interface ip add dns "%interfaceName%" 34.154.254.177 index=2
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:Cloudflare
echo Setting Cloudflare DNS...
netsh interface ip set dns "%interfaceName%" static 1.1.1.1 primary
netsh interface ip add dns "%interfaceName%" 1.0.0.1 index=2
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:Quad9
echo Setting Quad9 DNS...
netsh interface ip set dns "%interfaceName%" static 9.9.9.9 primary
netsh interface ip add dns "%interfaceName%" 149.112.112.112 index=2
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:AdGuardDNS
echo Setting AdGuard DNS...
netsh interface ip set dns "%interfaceName%" static 94.140.14.14 primary
netsh interface ip add dns "%interfaceName%" 94.140.15.15 index=2
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:YandexFamily
echo Setting YandexFamily DNS...
netsh interface ip set dns "%interfaceName%" static 77.88.8.7 primary
netsh interface ip add dns "%interfaceName%" 77.88.8.3 index=2
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:CleanBrowsing
echo Setting CleanBrowsing - Family mode DNS...
netsh interface ip set dns "%interfaceName%" static 185.228.168.168 primary
netsh interface ip add dns "%interfaceName%" 185.228.169.168 index=2
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:OpenDNSFamilyShield
echo Setting OpenDNS - FamilyShield DNS...
netsh interface ip set dns "%interfaceName%" static 208.67.222.123 primary
netsh interface ip add dns "%interfaceName%" 208.67.220.123 index=2
echo Current DNS settings for "%interfaceName%":
netsh interface ip show dns "%interfaceName%"
goto End

:Custom
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
