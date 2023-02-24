#!/bin/bash

# Update the package list and upgrade installed packages
sudo apt update
sudo apt upgrade -y

# Install Tor
sudo apt install tor -y

# Backup the original Tor configuration file
sudo cp /etc/tor/torrc /etc/tor/torrc.bak

# Configure the Tor relay settings
echo "ORPort 9001" | sudo tee -a /etc/tor/torrc
echo "Nickname <your_relay_nickname>" | sudo tee -a /etc/tor/torrc
echo "ContactInfo <your_email_address>" | sudo tee -a /etc/tor/torrc
echo "ExitPolicy reject *:*" | sudo tee -a /etc/tor/torrc
echo "Log notice file /var/log/tor/notices.log" | sudo tee -a /etc/tor/torrc
echo "RelayBandwidthRate 1000 KBytes" | sudo tee -a /etc/tor/torrc
echo "RelayBandwidthBurst 2000 KBytes" | sudo tee -a /etc/tor/torrc
echo "AccountingMax 50 GBytes" | sudo tee -a /etc/tor/torrc
echo "AccountingStart month 3 15:00" | sudo tee -a /etc/tor/torrc

# Restart Tor
sudo systemctl restart tor
