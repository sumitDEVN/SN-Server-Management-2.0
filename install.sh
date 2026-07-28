#!/bin/bash

echo "Installing SN Server Management 2.0..."

apt update

apt install openssh-server sudo net-tools lsb-release -y


chmod +x panel.sh
chmod +x lib/*.sh


echo ""
echo "Installation Complete!"
echo ""
echo "Run:"
echo "bash panel.sh"