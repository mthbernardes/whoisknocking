# Who is knocking
The purpose of this project is protect your host against unauthorized access and monitor all port scans activities via iptables. It's important to say that there's nothing new here, I just wanted to share the iptables configuration that I use on my computer.

# Dependencies
- rsyslog
- inotify-tools
- systemctl

# Install
After installing the dependencies just execute the `install.sh` script as root.

# How to use
After the installation you can execute the `whoisknocking.sh` script which is responsible to show you all scan attempts. 
