#!/bin/sh
PORT=`grep "Forwarded port updated to" /opt/piavpn/var/daemon.log | awk 'END {print $NF}'`
if [ -z "$PORT" ]
then
	notify-send "No output from pia_nw.log. Make sure PIA is running, has debugging enabled, and that you're connected!"
else
	sed "s/^Port.*/Port ${PORT}/g" /etc/ssh/sshd_config > ~/.pforward
	sudo mv ~/.pforward /etc/ssh/sshd_config
	sudo service ssh restart
	sudo service sshd restart
	echo "Port number: ${PORT}" | mail -s "SSH Port" #<YOUR EMAIL HERE>
	notify-send "Port number: ${PORT}"
fi
