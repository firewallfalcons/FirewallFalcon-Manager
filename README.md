# 🦅 FirewallFalcon Manager

**FirewallFalcon Manager** is an advanced **proxy/VPN orchestration script** built for performance, flexibility, and simplicity.  
It allows you to deploy and manage multiple tunneling and proxy protocols — all unified under a single **Nginx-powered gateway**.

---

## 🚀 Features

### 🔰 Multi-Protocol Support
Manage and run a wide range of VPN and proxy protocols seamlessly:
- **V2Ray / XRay** — Full support for all core protocols  
- **DNSTT (SlowDNS)** — For DNS-based tunneling  
- **UDPcustom** — For UDP-based tunneling  
- **SSH WebSocket (WS)** — With and without TLS support  

---

### 🌐 Nginx Integration
Nginx acts as the **main orchestrator**, intelligently routing traffic:
- Handles all incoming connections on **ports 80 and 443**
- Automatically forwards traffic to the correct backend (**V2Ray/Xray** or **SSH WS**)
- Offers **SSL/TLS termination** for secure connections

---

### 🧠 DT Proxy
**DT Proxy** is a lightweight WebSocket and SOCKS proxy that:
- Returns **fake HTTP responses** (`101 Switching Protocols` and `200 OK`)
- Accepts **all payload formats**
- Must run on **port 8080 (no SSL)** for perfect integration with Nginx  
  *(Ensures seamless compatibility with SSH WS on ports 80/443)*

---

### 🧩 Management Tools
- 🧑‍💻 **User Management** — Add, list, remove, and manage SSH users easily  
- 🔄 **Backup & Restore** — Preserve your user data between installs  
- 🖼️ **SSH Banner Management** — Customize your SSH login banner  
- 🌍 **Free Domain Generator** — Instantly get a free domain for testing or setup  
- 🔐 **SSL Certificate Generator** — Generate and apply SSL certificates for your custom or free domain directly through Nginx  

---

## 🧭 Installation

Run the following command for a **clean installation**:  

```bash
curl -L -o install.sh "https://raw.githubusercontent.com/firewallfalcons/FirewallFalcon-Manager/main/install.sh" && chmod +x install.sh && sudo ./install.sh && rm install.sh
