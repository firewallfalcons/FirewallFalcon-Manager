#!/bin/bash
set -e

# Must be root
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root."
   exit 1
fi

echo "Installing FirewallFalcon Manager..."

# URLs
MENU_URL="https://raw.githubusercontent.com/firewallfalcons/FirewallFalcon-Manager/main/menu.sh"
SSHD_URL="https://raw.githubusercontent.com/firewallfalcons/FirewallFalcon-Manager/main/ssh"

# Install menu
wget -4 -q -O /usr/local/bin/menu "$MENU_URL"
chmod +x /usr/local/bin/menu

# Apply SSH configuration
echo "Applying FirewallFalcon SSH configuration..."

SSHD_CONFIG="/etc/ssh/sshd_config"
BACKUP="/etc/ssh/sshd_config.backup.$(date +%F-%H%M%S)"

# Backup existing config
cp "$SSHD_CONFIG" "$BACKUP"

# Download new config
wget -4 -q -O "$SSHD_CONFIG" "$SSHD_URL"
chmod 600 "$SSHD_CONFIG"

# Validate SSH config before restart
if ! sshd -t; then
    echo "ERROR: SSH configuration is invalid!"
    echo "Restoring previous configuration..."
    cp "$BACKUP" "$SSHD_CONFIG"
    exit 1
fi

echo "SSH configuration validated."

# Restart SSH (auto-detect)
restart_ssh() {
    if command -v systemctl >/dev/null 2>&1; then
        systemctl restart sshd || systemctl restart ssh
    elif command -v service >/dev/null 2>&1; then
        service sshd restart || service ssh restart
    elif [ -x /etc/init.d/sshd ]; then
        /etc/init.d/sshd restart
    elif [ -x /etc/init.d/ssh ]; then
        /etc/init.d/ssh restart
    elif command -v rc-service >/dev/null 2>&1; then
        rc-service sshd restart || rc-service ssh restart
    else
        echo "WARNING: Could not automatically restart SSH."
        echo "Please restart SSH manually."
        return 1
    fi
}

restart_ssh

# Install FirewallFalcon setup
bash /usr/local/bin/menu --install-setup

echo "Installation complete!"
echo "Type 'menu' to start."
