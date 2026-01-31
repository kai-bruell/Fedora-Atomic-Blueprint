#!/usr/bin/env bash

set -oue pipefail

echo "=== Installing Devbox ==="

DEVBOX_VERSION="0.16.0"

curl -fsSL "https://github.com/jetify-com/devbox/releases/download/${DEVBOX_VERSION}/devbox_${DEVBOX_VERSION}_linux_amd64.tar.gz" \
  -o /tmp/devbox.tar.gz

tar -xzf /tmp/devbox.tar.gz -C /tmp
mv /tmp/devbox /usr/bin/devbox
chmod +x /usr/bin/devbox

rm -f /tmp/devbox.tar.gz

echo "=== Preparing /nix mount point for Fedora Atomic ==="

# Leeres Verzeichnis als Mount-Point (KEIN Symlink!)
# /var/nix wird beim Boot hierher bind-mounted
mkdir -p /nix

echo "=== Done ==="
