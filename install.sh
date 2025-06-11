case "$(uname -m)" in
  x86_64)
    echo "✅ Detected x86_64 architecture."
    curl -L -o 64install.sh "https://github.com/firewallfalcons/FirewallFalcon-Manager/raw/refs/heads/main/64install.sh" && chmod +x 64install.sh && sudo ./64install.sh && rm 64install.sh
    ;;
  aarch64 | arm64)
    echo "✅ Detected ARM architecture."
    curl -L -o arminstall.sh "https://github.com/firewallfalcons/FirewallFalcon-Manager/raw/refs/heads/main/arminstall.sh" && chmod +x arminstall.sh && sudo ./arminstall.sh && rm arminstall.sh
    ;;
  *)
    echo "❌ Unsupported architecture: $(uname -m)" >&2
    exit 1
    ;;
esac
