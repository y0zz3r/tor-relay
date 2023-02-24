# tor-relay

This is a Bash script that automates the process of setting up a Tor relay on a Debian 11 server, while also changing the SSH port to a random value between 1024 and 65535. Here's a breakdown of what the script does:

1. The script prompts the user to enter a nickname for the Tor relay.

2. The script generates a random port number between 1024 and 65535 using the shuf command.

3. The script updates the package repository and installs the necessary packages for Tor and firewall configuration. The firewall is configured to deny incoming traffic by default, allow outgoing traffic by default, and allow incoming traffic on the new SSH port and outgoing traffic on the default Tor port (9001).

4. The script adds the Tor Project signing key and repository to the package manager.

5. The script updates the package repository again and installs the latest version of Tor.

6. The script configures Tor to use the user-provided relay nickname and the default port for relays (9001). It also configures the relay to reject all exit traffic.

7. The script changes the SSH port to the randomly generated port number.

8. The script restarts the SSH and Tor services to apply the changes.

9. The script displays the Tor relay fingerprint and bandwidth information, which can be used to register the relay with the Tor network, as well as the newly generated SSH port number.

Overall, this script automates the process of setting up a secure Tor relay on a Debian 11 server, while also changing the SSH port to a random value to enhance security.
