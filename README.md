# PIA Port Forwarding

Use this script to get the port being forwarded in the updated PIA version (v1.0+ as of 2019), and set it to your receiving port for SSHing. It emails you the port it finds so you can get it when you can't access the machine directly.

## Requirements

* PIA must already be running and connecting to get a valid port number.
* You must setup `mail` in order for it to be able to email you (of course)

## How I use this script

Since my apartment doesn't allow any ports to be forwarded, I use PIA instead to get a port to connect to. I use FreeDNS as a dynamic DNS host (updated with a cronjob), and send the updated port number to my email. In my i3 config file, I launch `pia-client`, wait a bit, and then call this script to make it all work automatically. When I need to connect, I enter in my URL along with the custom port.
