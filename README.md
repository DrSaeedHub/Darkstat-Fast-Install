
# Darkstat Fast Install Script

This repository contains a Bash script that automates the installation and configuration of Darkstat, a network traffic analyzer for Linux. The script ensures that all necessary packages are installed, configures the network interface, and starts the Darkstat service.

## Usage

1. **Clone the Repository** (optional):
   ```bash
   git clone https://github.com/DrSaeedHub/Darkstat-Fast-Install.git
   cd Darkstat-Fast-Install
   ```

2. **Run the Script**:
   You can run the script directly using the following command:
   ```bash
   bash <(curl -Ls https://raw.githubusercontent.com/DrSaeedHub/Darkstat-Fast-Install/main/setup_darkstat.sh)
   ```

   Or if you have cloned the repository, run:
   ```bash
   sudo bash setup_darkstat.sh
   ```

## Features

- Installs required packages (`curl`, `gnupg2`, `unzip`, `git`, and `darkstat`).
- Automatically detects the network interface.
- Configures Darkstat with a default configuration.
- Opens the required firewall port for Darkstat.
- Enables and starts the Darkstat service.

## Prerequisites

- A Linux-based operating system (Debian/Ubuntu recommended).
- Root privileges are required to run this script.

## Script Overview

The script performs the following tasks:

1. **ASCII Art Header**: Displays a welcoming header in green color.
2. **Root Check**: Ensures the script is run with root privileges.
3. **System Update**: Updates the package list and upgrades the installed packages.
4. **Package Installation**: Installs `curl`, `gnupg2`, `unzip`, `git`, and `darkstat`.
5. **Network Interface Detection**: Automatically detects the network interface to be used by Darkstat.
6. **Configuration File Creation**: Generates a configuration file at `/etc/darkstat/init.cfg` with the detected interface and other settings.
7. **Firewall Configuration**: Configures UFW to allow traffic on port 666/tcp.
8. **Service Management**: Reloads systemd, enables the Darkstat service, and starts it.
9. **Completion Message**: Displays a success message upon completion.


## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## Acknowledgments

- [Darkstat](https://darkstat.cnas.org/) - Network traffic analyzer.

