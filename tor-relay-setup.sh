#!/bin/bash

# Prompt user for nickname for the Tor relay
read -p "Enter a nickname for the Tor relay: " RELAY_NICKNAME

# Update packages and install required packages
sudo apt-get update
sudo apt-get install -y apt-transport-https gnupg curl ufw

# Configure the firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 9001/tcp
sudo ufw enable

# Add Tor Project signing key and repository
curl https://deb.torproject.org/key.asc | sudo gpg --import -
echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/tor.list
echo "deb-src https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/tor.list

# Update packages and install Tor
sudo apt-get update
sudo apt-get install -y tor

# Configure Tor relay settings
sudo sed -i "s/#Nickname\ \".*\"/Nickname $RELAY_NICKNAME/" /etc/tor/torrc
sudo sed -i "s/#ORPort\ \d+/ORPort 9001/" /etc/tor/torrc
sudo sed -i "s/#ExitPolicy\ accept\ \*\:\*/ExitPolicy reject \*:\*/" /etc/tor/torrc

# Restart Tor
sudo systemctl restart tor

# Display the Tor relay fingerprint and bandwidth information
echo "Tor Relay Fingerprint: $(sudo cat /var/lib/tor/$RELAY_NICKNAME/fingerprint)"
echo "Tor Relay Bandwidth: $(sudo cat /var/lib/tor/$RELAY_NICKNAME/bandwidth)"
