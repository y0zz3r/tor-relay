Setting up a Tor Relay on Ubuntu
======================

This script automates the process of setting up a Tor relay on Ubuntu. It configures the firewall, adds the Tor Project signing key and repository, installs Tor, and configures the Tor relay settings.

Prerequisites
-------------

*   Ubuntu operating system
*   Root privileges

Installation
------------

1.  Clone this repository:
    
    ```
    git clone https://github.com/y0zz3r/tor-relay.git
    ```
    
2.  Change into the cloned directory:
    
    ```
    cd tor-relay-setup
    ```
    
3.  Run the script:
    
    ```
    sudo ./setup-tor-relay.sh
    ```
    
4.  Follow the prompts to configure the Tor relay settings.


Configuration
-----

*   The script will prompt you for a nickname for the Tor relay. This name must be unique and not already in use by another Tor relay.
    

Verification
-----

*   The script will display the Tor relay fingerprint and bandwidth information once the Tor relay is set up. You can also verify that your relay is running by visiting the Tor Metrics website.


Disclaimer
-----

*   This script is provided "as is" without warranty of any kind, express or implied. The author shall not be liable for any damages arising from the use of this script.
