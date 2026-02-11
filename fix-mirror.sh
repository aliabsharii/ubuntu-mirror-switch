#!/bin/bash

echo "===== Switching Ubuntu 24.04 to Pishgaman Mirror ====="

FILE="/etc/apt/sources.list.d/ubuntu.sources"

if [ ! -f "$FILE" ]; then
    echo "ubuntu.sources not found!"
    exit 1
fi

echo "Taking backup..."
cp $FILE ${FILE}.bak.$(date +%F-%H%M)

echo "Writing new mirror config..."

cat > $FILE <<EOF
Types: deb
URIs: http://ubuntu.pishgaman.net/ubuntu/
Suites: noble noble-updates noble-backports noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF

echo "Cleaning apt cache..."
apt clean

echo "Updating..."
apt update

echo "Done. Checking mirror source..."
apt update | grep ubuntu.pishgaman.net

echo "===== Finished ====="
