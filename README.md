DNS Switcher Script
-
The DNS Switcher Script is a Windows batch file crafted to empower users with the flexibility to switch their network interface's DNS settings to Google DNS (for enhanced speed and reliability, especially with Google services), Default DNS (provided by your ISP, potentially offering better local content delivery), NOTO DNS (optimized for surfing Web3 domains), also, "Cloudflare (Fast and promises to wipe all logs within 24 hours), Quad9 (Puts emphasis on security by blocking malicious domains), AdGuard DNS (Anti advertisement), YandexFamily (Protection from virus, fraudulent content and adult content filtering), CleanBrowsing (with Family Mode, which filters out adult content), OpenDNS (with FamilyShield, Pre-configured to block adult content, making it easier for parents to manage internet safety) or Custom DNS (tailored for other specific needs). Additionally, it provides the convenience of printing all network configurations before any modifications, ensuring users make informed changes.

Features
-
Print Network Configurations: Displays all current network configurations using ipconfig /all.
Interface Selection: Allows users to select the network interface they wish to configure. Supports Ethernet, Wi-Fi, and manual entry of the interface name.

DNS Configuration: 
-
Users can choose to set the DNS to Google's DNS, default DNS, NOTO DNS, or manually enter DNS server addresses.

How to Use
-
Run the Script: Right-click on the changedns.bat file and select "Run as administrator". This is necessary to ensure the script has the required permissions to modify network settings.
+
Print Network Configurations (Optional): At the prompt, you can choose to print all current network configurations. This is useful for backing up your current settings before making changes.
+
Select Network Interface: Choose the network interface you wish to configure. You can select either Ethernet or Wi-Fi, or manually enter the name of the interface(also, will print the list of supported isnterfaces).
+
Choose DNS Configuration: Select one of the DNS configuration options:
1. Google DNS
2. Default DNS (obtain DNS server address automatically)
3. NOTO DNS
4. Manual entry of DNS server addresses
(Manual DNS Entry (If Selected): If you choose to manually enter DNS server addresses, you will be prompted to enter the primary and (optionally) secondary DNS server addresses.)
+
Completion: Once you've made your selection, the script will apply the changes, and you'll see a message indicating the operation is completed.

Requirements
-
Windows operating system (Windows XP and later versions)
Administrative privileges to run the script

Caution
-
Always ensure you have a backup of your current network settings before making changes.
The script modifies network settings, which could affect your internet connectivity if configured incorrectly.

License
-
This script is provided "as is", without warranty of any kind, express or implied. Use at your own risk.
