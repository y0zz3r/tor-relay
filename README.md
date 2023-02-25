# tor-relay

This Bash script sets up a Tor relay on a Debian 11 server and changes the SSH port to a random value. It prompts the user for a Tor relay nickname, generates a random port number, installs necessary packages, adds the Tor Project signing key and repository, configures Tor to use the provided nickname and port, and restarts SSH and Tor services. It also displays the Tor relay fingerprint, bandwidth information, and newly generated SSH port number.
