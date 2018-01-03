#!/bin/sh

/etc/init.d/apache2 restart
/etc/init.d/vsftpd restart
dnsmasq -C /etc/dnsmasq.conf -k
