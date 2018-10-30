#!/bin/bash

#######################################################
### Autor: Nico Hartung <nicohartung1@googlemail.com> #
#######################################################

###===###
# Usage #
###===###

# ./cron_sonos-reboot.sh 192.168.1.40 192.168.1.41 192.168.1.39
#
# Reboot of 192.168.1.40 (CSRFToken: g8mlBFoxeBUTcABWF4LWgD3SsxwUF89l) successful.
# Reboot of 192.168.1.41 (CSRFToken: GOd8xFfpxWG/cNieUmlABLrL0N7SVavL) successful.
# CSRFToken of 192.168.1.39 cannot be curled.


###=======###
# Variables #
###=======###

TIMEOUT=2


###====###
# Script #
###====###

for IP in $@; do
	TOKEN=`curl --connect-timeout ${TIMEOUT} -s "http://${IP}:1400/reboot" |  awk '/csrfToken/{print $6}' | sed 's/value=//g;s/"//g'`
    if [ ! -z "${TOKEN}" ]; then
        curl --connect-timeout ${TIMEOUT} -s "http://${IP}:1400/reboot" --data-urlencode "csrfToken=${TOKEN}" | grep -iq "Rebooting"
        if [ 0 -eq ${?} ]; then
            echo "Reboot of ${IP} (CSRFToken: ${TOKEN}) successful."
        else
            echo "Reboot of ${IP} (CSRFToken: ${TOKEN}) failed."
        fi
    else
        echo "CSRFToken of ${IP} cannot be curled."
    fi
done
