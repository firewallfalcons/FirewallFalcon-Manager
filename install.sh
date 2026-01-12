#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root."
   exit 1
fi

echo "Installing FirewallFalcon Manager..."

# Force IPv4 to avoid GitHub IPv6 timeouts
MENU_URL="https://raw.githubusercontent.com/firewallfalcons/FirewallFalcon-Manager/main/menu.sh"

# Download using wget -4 (IPv4 only)
wget -4 -q -O /usr/local/bin/menu "$MENU_URL"

# Make executable
chmod +x /usr/local/bin/menu

# Execute using bash to bypass CRLF/Shebang issues
bash /usr/local/bin/menu --install-setup

echo "Installation complete! Type 'menu' to start."
