#!/bin/bash

# ASCII Art Header
echo -e "\033[0;32m"
echo "  _____          _____                     _ "
echo " |  __ \        / ____|                   | |"
echo " | |  | |_ __  | (___   __ _  ___  ___  __| |"
echo " | |  | | '__|  \___ \ / _ |/ _ \/ _ \/ _ |"
echo " | |__| | |     ____) | (_| |  __/  __/ (_| |"
echo " |_____/|_|    |_____/ \__,_|\___|\___|\__,_|"
echo -e "\033[0m"

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
  echo -e "\033[0;31mThis script must be run as root. Please run again with 'sudo'.\033[0m"
  exit 1
fi

# Console colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Perform system update and upgrade
echo -e "${GREEN}Updating system packages...${NC}"
apt update && apt upgrade -y

echo -e "${GREEN}nstalling required packages...${NC}"
# Install required packages
sudo apt install curl gnupg2 unzip git -y
sudo apt install darkstat -y

# Get the interface from the command
INTERFACE=$(ip route get 8.8.8.8 | awk '{print $5}')

# Create the init.cfg file for darkstat
echo -e "${GREEN}Creating configuration file...${NC}"
cat > /etc/darkstat/init.cfg << EOF
START_DARKSTAT=yes
INTERFACE="-i $INTERFACE"
DIR="/var/lib/darkstat"
PORT="-p 666"
BINDIP="-b 0.0.0.0"
LOCAL="-l 192.168.0.1/255.255.255.0"
EOF


# Allow traffic on port 666/tcp via UFW
echo -e "${GREEN}Configuring UFW...${NC}"
ufw allow 666/tcp
ufw reload

# Reload systemd, enable and start the service
echo -e "${GREEN}Enabling and starting Darkstat service...${NC}"
systemctl daemon-reload
systemctl enable darkstat
systemctl start darkstat
# Restart darkstat service
sudo systemctl restart darkstat

echo -e "${GREEN}Darkstat installation completed successfully!${NC}"
echo "Done."