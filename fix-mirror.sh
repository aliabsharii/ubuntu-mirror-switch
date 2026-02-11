#!/bin/bash

echo "===== Switching Ubuntu to Pishgaman Mirror ====="

FILE="/etc/apt/sources.list.d/ubuntu.sources"
BACKUP_DIR="/root/apt-backups"

if [ ! -f "$FILE" ]; then
    echo "ubuntu.sources not found!"
    exit 1
fi

# تشخیص نسخه Ubuntu
VERSION=$(lsb_release -cs)
echo "Ubuntu version detected: $VERSION"

# ساخت پوشه بکاپ
mkdir -p $BACKUP_DIR

# گرفتن بکاپ و انتقال به پوشه امن
cp $FILE ${BACKUP_DIR}/ubuntu.sources.bak.$(date +%F-%H%M)

echo "Writing new mirror config..."

cat > $FILE <<EOF
Types: deb
URIs: http://ubuntu.pishgaman.net/ubuntu/
Suites: $VERSION $VERSION-updates $VERSION-backports $VERSION-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF

# پاک کردن بکاپ‌های قدیمی اگر اشتباهی داخل sources.list.d مانده باشند
mv /etc/apt/sources.list.d/*.bak.* $BACKUP_DIR 2>/dev/null

echo "Cleaning apt cache..."
apt clean

echo "Updating..."
apt update

echo "===== Mirror successfully updated ====="
