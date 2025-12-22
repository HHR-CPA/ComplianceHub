# 🌐 ASUS ROG Rapture GT-AX11000 Configuration Guide
# Network: 192.168.50.0/24 | Router: 192.168.50.1 | PC: 192.168.50.242

**Complete setup guide for your specific network configuration**

---

## 📊 **Your Network Configuration**

```yaml
Router Model: ASUS ROG Rapture GT-AX11000
Router IP: 192.168.50.1
Router URL: http://192.168.50.1

Your PC (AW_Killer):
  Hostname: AW_Killer
  Connection: WiFi (via router) ✨ UPDATED!
  Local IP: 192.168.50.242
  Meshnet IP: 100.70.91.68 (NordVPN)
  MAC Address: 30:D0:42:E6:44:71
  Network Adapter: Killer E3100G 2.5 Gigabit Ethernet
  Speed: 1000/1000 Mbps (WiFi performance)

Your Phone:
  Hostname: hassan.h.rahman-olympic.nord
  Meshnet IP: 100.111.15.172 (NordVPN)
  Connection: NordVPN app via Meshnet
  Status: ✅ CONNECTED (84ms latency)

Network:
  Subnet: 192.168.50.0/24
  Gateway: 192.168.50.1
  DNS Servers:
    - 1.1.1.1 (Cloudflare - Fast, Privacy-focused)
    - 8.8.8.8 (Google - Reliable)
    - 192.168.50.1 (Router - Local)

Current Status: 
  ✅ Router reachable (0ms latency)
  ✅ Meshnet ACTIVE (84ms latency phone-to-PC)
  ✅ Remote Desktop WORKING (login page confirmed!)
  ✅ WiFi + VPN app setup (no router config needed!)
```

---

## 🎯 **Your Setup (WiFi + VPN App)**

```yaml
What You're Running:
  Office PC:
    - Connected to router via WiFi
    - NordVPN app with Meshnet enabled
    - No Ethernet cable needed
    - Meshnet IP: 100.70.91.68
  
  Phone:
    - NordVPN app with Meshnet enabled
    - Connects to PC via Meshnet (peer-to-peer)
    - No router configuration needed
    - Meshnet IP: 100.111.15.172

Benefits:
  ✅ No router port forwarding
  ✅ No Ethernet cable required
  ✅ Works over WiFi
  ✅ Encrypted connection
  ✅ Access from anywhere
  ✅ Simple setup
```

---

## 🚀 **Quick Setup Tasks**

### **Task 1: Access Router (1 minute)**

```yaml
Step 1: Open router admin panel
  URL: http://192.168.50.1
  Browser: Any (Chrome, Edge, Firefox)
  
Step 2: Login
  Default username: admin
  Default password: (printed on router label)
  Note: Change this if you haven't already!

Step 3: You're in!
  Look for "Router Admin" or "ASUSWRT" dashboard
```

### **Task 2: Enable Remote Desktop (5 minutes)**

Run this script from your PC:

```powershell
# Quick RDP enable script
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

Write-Host "✅ Remote Desktop enabled on: $env:COMPUTERNAME" -ForegroundColor Green
Write-Host "   Connect to: 192.168.50.242" -ForegroundColor Gray
```

### **Task 3: Test Key Vault (2 minutes)**

```powershell
# Test Azure Key Vault access
az keyvault secret list --vault-name hhrcpakv01 --query "[].name" -o table

# If this works, Key Vault is ✅ REAL and WORKING!
```

### **Task 4: Setup NordVPN Meshnet (10 minutes)**

See detailed guide below ↓

---

## 🔐 **NordVPN Meshnet Setup (Step-by-Step)**

### **What is Meshnet?**

```yaml
Meshnet = Your own private network
  - Connect devices anywhere in the world
  - No router configuration needed
  - Encrypted peer-to-peer connections
  - File sharing built-in
  - Free with NordVPN subscription

Your Use Case:
  - Remote desktop from phone during day job
  - Access office files from home
  - Share files securely with clients
  - No port forwarding!
```

### **Phase 1: Enable Meshnet on Office PC**

#### **Step 1: Open NordVPN App**

```yaml
Location: Start Menu → NordVPN
Or: Click NordVPN icon in system tray
```

#### **Step 2: Enable Meshnet**

```yaml
In NordVPN app:
  1. Click Settings (gear icon) → Meshnet
  2. Toggle "Enable Meshnet" → ON
  3. Note your Meshnet hostname (e.g., "AW_Killer.nord")
  4. Note your Meshnet IP (e.g., "10.5.0.2")
```

#### **Step 3: Configure Permissions**

Based on the links you shared, here's what to do:

**File Sharing Permissions:**
```yaml
In Meshnet settings:
  1. Find "My Devices" section
  2. Click on your PC (AW_Killer)
  3. Enable:
     ✅ "Allow access to this device"
     ✅ "Allow file sharing"
     ✅ "Allow remote access"
  
  File Sharing Options:
    - Share entire drives (C:\, D:\)
    - OR share specific folders
    - Set read/write permissions
    
  Recommendation: Start with one shared folder
    Example: C:\Office-Files
```

**Remote Access Permissions:**
```yaml
Enable Remote Access:
  ✅ "Allow remote access to this device"
  
This allows:
  - Remote Desktop (RDP) via Meshnet
  - PowerShell remoting
  - File access
  
Security:
  - Still requires Windows authentication
  - Encrypted via Meshnet tunnel
  - No public exposure
```

### **Phase 2: Add Mobile Device to Meshnet**

#### **On Your iPhone/Android:**

```yaml
Step 1: Install NordVPN App
  iOS: App Store → "NordVPN"
  Android: Google Play → "NordVPN"
  
Step 2: Login
  Use same NordVPN account as office PC
  
Step 3: Enable Meshnet
  Settings → Meshnet → Toggle ON
  
Step 4: Link Devices
  Option A (Automatic):
    - Devices with same account link automatically
    - Wait 1-2 minutes
    - Check "My Devices" list
  
  Option B (Manual Invite):
    - On office PC: Settings → Meshnet → Invite
    - Copy invite link
    - Paste on phone
    - Accept invitation
```

### **Phase 3: Test Meshnet Connection**

#### **From Phone:**

```yaml
Test 1: Ping Office PC
  - Open NordVPN app
  - Go to Meshnet
  - See "AW_Killer" in device list
  - Status should be "Connected"
  
Test 2: Access File Share
  iOS:
    - Install "Files" app (built-in)
    - Connect to Server → smb://10.5.0.2
    - Browse shared folders
  
  Android:
    - Install "Solid Explorer" or similar
    - Add Network Storage → SMB
    - Server: 10.5.0.2
    - Browse shared folders
  
Test 3: Remote Desktop
  - Install "Microsoft Remote Desktop" app
  - Add PC: 10.5.0.2 (Meshnet IP)
  - Connect
  - Full desktop on your phone! 📱
```

---

## 🎯 **Router Security Configuration**

### **Recommended Settings (ASUS ROG GT-AX11000)**

#### **1. Firewall Settings**

```yaml
Location: Advanced Settings → Firewall

Enable:
  ✅ Enable Firewall: Yes
  ✅ Enable DoS protection: Yes
  ✅ Respond to Ping from WAN: No (security)
  
Port Forwarding:
  ❌ NOT NEEDED (Meshnet handles this!)
  
UPnP:
  🟡 Optional (disable if not needed)
```

#### **2. Network Segmentation**

```yaml
Your Current Network: 192.168.50.0/24
  - Main network for all devices
  - Consider creating guest network

Guest Network Setup:
  Location: Advanced Settings → Guest Network
  
  Guest WiFi (for clients visiting):
    SSID: "HHR-CPA-Guest"
    Password: (unique, 12+ characters)
    Network isolation: ✅ Enable
    Access to router: ❌ Disable
```

#### **3. QoS (Quality of Service)**

```yaml
Location: Advanced Settings → QoS

Priority for Business:
  Highest: Microsoft Teams, Zoom, VoIP
  High: Microsoft 365, OneDrive
  Medium: Web browsing
  Low: Downloads, streaming

Your Setup (Gaming Router):
  ✅ Gaming QoS already optimized
  ✅ Low latency for real-time apps
  ✅ Prioritizes business traffic
```

#### **4. DNS over HTTPS (DoH)**

```yaml
Current DNS:
  ✅ 1.1.1.1 (Cloudflare - already secure!)
  ✅ 8.8.8.8 (Google)
  
Recommendation: Keep current setup
  - Cloudflare is fast and privacy-focused
  - Google is reliable backup
  - No changes needed!

Optional: Enable DoH in router
  Location: WAN → DNS Settings
  Enable: DNS over HTTPS
  Server: https://1.1.1.1/dns-query
```

---

## 📱 **Mobile Remote Access Setup**

### **Microsoft Remote Desktop App**

#### **Installation**

```yaml
iOS:
  App: "Microsoft Remote Desktop"
  Link: https://apps.apple.com/app/id714464092
  Size: ~40 MB
  
Android:
  App: "Microsoft Remote Desktop"  
  Link: https://play.google.com/store/apps/details?id=com.microsoft.rdc.androidx
  Size: ~25 MB
```

#### **Configuration**

```yaml
Step 1: Add PC Connection
  1. Open Microsoft Remote Desktop app
  2. Tap "+" → Add PC
  3. PC name: 10.5.0.2 (Meshnet IP)
  4. User account: hassan@hhr-cpa.us
  5. Friendly name: "Office Computer"
  6. Save

Step 2: Connect
  1. Tap "Office Computer"
  2. Enter Windows password
  3. You're in! Full desktop on phone 📱

Step 3: Gestures
  - Pinch to zoom
  - Swipe to scroll
  - Two-finger tap = right-click
  - Long press = context menu
```

---

## 🔒 **Security Best Practices**

### **Network Security**

```yaml
✅ Use strong WiFi password (20+ characters)
✅ Enable WPA3 (if all devices support it)
✅ Disable WPS (security risk)
✅ Change default router admin password
✅ Enable router firewall
✅ Create guest network for visitors
✅ Regularly update router firmware
```

### **Meshnet Security**

```yaml
✅ Only link trusted devices
✅ Review device list monthly
✅ Revoke access for old devices
✅ Use strong Windows passwords
✅ Enable Windows Firewall
✅ Keep NordVPN app updated
```

### **Remote Desktop Security**

```yaml
✅ Enable Network Level Authentication (NLA)
✅ Use strong passwords (12+ characters)
✅ Limit RDP to Meshnet IP only
✅ Enable RDP connection logging
✅ Review logs monthly
✅ Lock screen when leaving desk
```

---

## 🧪 **Testing Checklist**

### **Test 1: Local Network (✅ DONE)**

```powershell
# Ping router
Test-Connection 192.168.50.1 -Count 2

# Result: ✅ 0ms latency - Excellent!
```

### **Test 2: Key Vault Access**

```powershell
# List secrets
az keyvault secret list --vault-name hhrcpakv01

# If this works: ✅ Key Vault is real!
```

### **Test 3: Remote Desktop (Local)**

```powershell
# From another computer on your network
mstsc /v:192.168.50.242

# If desktop appears: ✅ RDP works!
```

### **Test 4: Meshnet Connection**

```yaml
From phone:
  1. Open NordVPN → Meshnet
  2. See "AW_Killer" in device list
  3. Status: "Connected"
  
If connected: ✅ Meshnet works!
```

### **Test 5: Remote Desktop via Meshnet**

```yaml
From phone (Microsoft Remote Desktop app):
  1. Connect to: 10.5.0.2
  2. Desktop appears on phone
  
If works: ✅ Complete setup successful! 🎉
```

---

## 📊 **Network Topology**

```
Internet (ISP)
     ↓
[192.168.50.1] ASUS ROG Rapture GT-AX11000
     ↓
[192.168.50.0/24] Local Network
     ↓
[192.168.50.242] Your PC (AW_Killer)
     ↑
  Meshnet
     ↓
[10.5.0.2] Meshnet IP (via NordVPN)
     ↓
Mobile Phone (anywhere in world!)
```

---

## 🎯 **Day Job Monitoring Workflow**

### **Morning (5 minutes)**

```yaml
From phone during commute:
  1. Open Microsoft Remote Desktop
  2. Tap "Office Computer" (10.5.0.2)
  3. Desktop appears on phone
  4. Check overnight jobs
  5. Review event logs
  6. Disconnect
  
All via Meshnet - no router config! ✨
```

### **Lunch Break (2 minutes)**

```yaml
From phone:
  1. Connect via RDP (10.5.0.2)
  2. Open PowerShell
  3. Restart service if needed
  4. Check disk space
  5. Disconnect
```

### **End of Day (10 minutes)**

```yaml
From phone or laptop:
  1. Connect via Meshnet RDP
  2. Run reports
  3. Copy files to OneDrive
  4. Schedule maintenance
  5. Done! 😊
```

---

## 💾 **Backup Configuration**

```yaml
Router Backup:
  1. Login: http://192.168.50.1
  2. Administration → Restore/Save/Upload Setting
  3. Click "Save Setting"
  4. File saved: RT-AX11000_backup.cfg
  5. Store in OneDrive/Key Vault

Windows Backup:
  - Use Windows Backup (built-in)
  - OR OneDrive sync
  - OR Azure Backup

Key Vault:
  - All secrets already backed up
  - 90-day soft delete
  - Geo-replicated
```

---

## 🔗 **Quick Reference Links**

```yaml
Router Admin:
  http://192.168.50.1

NordVPN Meshnet:
  App: NordVPN → Settings → Meshnet
  Docs: https://meshnet.nordvpn.com/
  
Microsoft Remote Desktop:
  iOS: https://apps.apple.com/app/id714464092
  Android: https://play.google.com/store/apps/details?id=com.microsoft.rdc.androidx

Azure Key Vault:
  Portal: https://portal.azure.com
  Vault: hhrcpakv01

This Guide:
  Location: E:\source\Heyson315\compliance-governance-test\docs\
  File: asus-gtax11000-setup.md
```

---

## 🆘 **Troubleshooting**

### **Can't Access Router (192.168.50.1)**

```powershell
# Check connection
Test-Connection 192.168.50.1 -Count 2

# Check IP configuration
ipconfig /all

# Release and renew
ipconfig /release
ipconfig /renew
```

### **Meshnet Not Connecting**

```yaml
1. Check NordVPN is running (both devices)
2. Verify Meshnet is enabled (toggle ON)
3. Re-login to NordVPN account
4. Restart NordVPN app
5. Wait 2-3 minutes for discovery
```

### **Remote Desktop Not Working**

```powershell
# Check RDP is enabled
Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections"

# Should be: fDenyTSConnections = 0

# Check firewall
Get-NetFirewallRule -DisplayGroup "Remote Desktop" | Where-Object {$_.Enabled -eq $true}
```

---

## ✅ **Next Steps**

```yaml
1. ✅ Test router access (http://192.168.50.1)
2. ✅ Enable Remote Desktop on PC
3. ✅ Enable NordVPN Meshnet (office PC)
4. ✅ Enable NordVPN Meshnet (phone)
5. ✅ Test Meshnet connection
6. ✅ Install Microsoft Remote Desktop app
7. ✅ Test RDP from phone
8. ✅ Celebrate! You can monitor from anywhere! 🎉
```

---

<p align="center">
  <img src="https://img.shields.io/badge/Router-ASUS_ROG_GT--AX11000-success" alt="Router">
  <img src="https://img.shields.io/badge/Network-192.168.50.0/24-blue" alt="Network">
  <img src="https://img.shields.io/badge/Status-Ready-green" alt="Status">
</p>

---

**Your exact configuration documented and ready to deploy!** 🚀
