#!/bin/bash

set -euo pipefail

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Prompt user for nickname for the Tor relay
read -p "Enter a nickname for the Tor relay: " RELAY_NICKNAME

# Update packages and install required packages
apt-get update
apt-get upgrade -y
apt-get install -y apt-transport-https gnupg curl ufw

# Configure the firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow 9001/tcp
ufw enable

# Verify Tor Project signing key and add repository
curl https://keys.openpgp.org/vks/v1/by-fingerprint/0xEF6E286DDA85EA2A4BA7DE684E2C6E8793298290 | gpg --import -
curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import -
gpg --verify /tmp/torproject.asc /tmp/torproject.asc.sig
echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/tor.list
echo "deb-src https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/tor.list

# Check if Tor is already installed
if ! command -v tor &> /dev/null
then
    # Install Tor
    apt-get update
    apt-get install -y tor
fi

# Configure Tor relay settings
sed -i "s/#Nickname\ \".*\"/Nickname $RELAY_NICKNAME/" /etc/tor/torrc
sed -i "s/#ORPort\ \d+/ORPort 9001/" /etc/tor/torrc
sed -i "s/#ExitPolicy\ accept\ \*\:\*/ExitPolicy reject \*:\*/" /etc/tor/torrc

# Restart Tor
systemctl restart tor

# Display the Tor relay fingerprint and bandwidth information
echo "Tor Relay Fingerprint: $(cat /var/lib/tor/$RELAY_NICKNAME/fingerprint)"
echo "Tor Relay Bandwidth: $(cat /var/lib/tor/$RELAY_NICKNAME/bandwidth)"
