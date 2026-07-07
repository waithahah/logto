#!/bin/bash
set -e

# Target directory for SSL certs
SSL_DIR="$(dirname "$0")/ssl"
mkdir -p "$SSL_DIR"

TARGET_IP=${1:-"172.18.6.34"}
echo "Generating self-signed SSL certificates for IP/Domain: $TARGET_IP"

# Create a temporary config file for openssl to include IP SAN
CONF_FILE=$(mktemp)
cat <<EOF > "$CONF_FILE"
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no

[req_distinguished_name]
C = CN
ST = Beijing
L = Beijing
O = Logto Dev
CN = $TARGET_IP

[v3_req]
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
IP.1 = $TARGET_IP
IP.2 = 127.0.0.1
DNS.1 = localhost
DNS.2 = auth.qutewear.com
DNS.3 = admin.qutewear.com
EOF

# Generate key and cert
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$SSL_DIR/logto.key" \
  -out "$SSL_DIR/logto.crt" \
  -config "$CONF_FILE"

rm "$CONF_FILE"

echo "Certificates successfully generated in: $SSL_DIR/"
chmod 600 "$SSL_DIR/logto.key"
chmod 644 "$SSL_DIR/logto.crt"
