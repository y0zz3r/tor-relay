Tor Relay Setup Script
======================

This script sets up a Tor relay on a Debian-based system. It prompts the user for a nickname for the Tor relay, installs required packages, configures the firewall, adds the Tor Project signing key and repository, installs Tor, and sets up the Tor relay settings.

Prerequisites
-------------

*   A Debian-based system (tested on Ubuntu 18.04 and 20.04)
*   sudo privileges

Instructions
------------

1.  Clone this repository or copy the script to your local machine.
    
2.  Open a terminal window and navigate to the directory containing the script.
    
3.  Make the script executable with the following command:
    
    bash
    
    ```bash
    chmod +x tor-relay-setup.sh
    ```
    
4.  Run the script with the following command:
    
    bash
    
    ```bash
    ./tor-relay-setup.sh
    ```
    
5.  When prompted, enter a nickname for your Tor relay.
    
6.  Follow the prompts to install and configure Tor.
    
7.  Once the script has completed, the Tor relay fingerprint and bandwidth information will be displayed.
    

Notes
-----

*   This script assumes that you want to use port 9001 for your Tor relay. If you want to use a different port, modify the `ORPort` setting in the script before running it.
    
*   By default, this script configures the Tor relay to reject all exit traffic. If you want to allow certain exit traffic, modify the `ExitPolicy` setting in the script before running it.
    
*   If you want to view the Tor relay logs, run the following command:
    
    bash
    
    ```bash
    sudo tail -f /var/log/tor/log
    ```
    
*   To stop the Tor relay, run the following command:
    
    vbnet
    
    ```
    sudo systemctl stop tor
    ```
    
*   To start the Tor relay, run the following command:
    
    sql
    
    ```sql
    sudo systemctl start tor
    ```
    

License
-------

This script is licensed under the [MIT License](https://github.com/username/repo/blob/master/LICENSE).

---
