#!/bin/bash

#######################################################
### Autor: Nico Hartung <nicohartung1@googlemail.com> #
#######################################################

###=======###
# Variablen #
###=======###

IPS="192.168.1.40
192.168.1.41"


###====###
# Skript #
###====###

for IP in ${IPS}; do
	TOKEN=`curl -s "http://${IP}:1400/reboot" |  awk '/csrfToken/{print $6}' | sed 's/value=//g;s/"//g'`
    curl -s "http://${IP}:1400/reboot" --data-urlencode "csrfToken=${TOKEN}" | grep -iq "Rebooting"
    if [ $? -eq 0 ]; then
        echo "Reboot of ${IP} (csrfToken: ${TOKEN}) successful."
    else
        echo "Reboot of ${IP} (csrfToken: ${TOKEN}) failed."
    fi
done
