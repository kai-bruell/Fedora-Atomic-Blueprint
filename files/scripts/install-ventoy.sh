#!/usr/bin/env bash

set -oue pipefail

VENTOY_VERSION="1.1.05"

# Cleanup any previous attempts
rm -rf /tmp/ventoy.tar.gz /tmp/ventoy-${VENTOY_VERSION} /usr/local/lib/ventoy

curl -L "https://github.com/ventoy/Ventoy/releases/download/v${VENTOY_VERSION}/ventoy-${VENTOY_VERSION}-linux.tar.gz" \
  -o /tmp/ventoy.tar.gz

tar -xzf /tmp/ventoy.tar.gz -C /tmp

# Install complete ventoy directory
mkdir -p /usr/local/lib/ventoy
cp -r /tmp/ventoy-${VENTOY_VERSION}/* /usr/local/lib/ventoy/

# Create wrapper scripts that cd to correct directory
mkdir -p /usr/local/bin
cat > /usr/local/bin/ventoy << 'EOF'
#!/bin/bash
cd /usr/local/lib/ventoy && sudo ./Ventoy2Disk.sh "$@"
EOF

cat > /usr/local/bin/ventoy-web << 'EOF'
#!/bin/bash
cd /usr/local/lib/ventoy && sudo ./VentoyWeb.sh "$@"
EOF

chmod +x /usr/local/bin/ventoy /usr/local/bin/ventoy-web

# Cleanup
rm -rf /tmp/ventoy.tar.gz /tmp/ventoy-${VENTOY_VERSION}
