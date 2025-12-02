#!/bin/bash

sudo wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/firewallfalcons/FirewallFalcon-Manager/refs/heads/main/ssh > /dev/null 2>&1
sudo systemctl restart sshd || sudo service sshd restart || sudo systemctl restart ssh || sudo service ssh restart > /dev/null 2>&1

case "$(uname -m)" in
  x86_64)
    echo "✅ Detected x86_64 architecture."
    curl -L -o 64install.sh "https://github.com/firewallfalcons/FirewallFalcon-Manager/raw/refs/heads/main/64install.sh" && chmod +x 64install.sh && ./64install.sh && rm 64install.sh
    ;;
  aarch64 | arm64)
    echo "✅ Detected ARM architecture."
    curl -L -o arminstall.sh "https://github.com/firewallfalcons/FirewallFalcon-Manager/raw/refs/heads/main/arminstall.sh" && chmod +x arminstall.sh &&  ./arminstall.sh && rm arminstall.sh
    ;;
  *)
    echo "❌ Unsupported architecture: $(uname -m)" >&2
    exit 1
    ;;
esac
