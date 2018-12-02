# cron_sonos-reboot - Sonos speaker reboot bash script - every day, once a week, as you like.

## quick 'n dirty scripting

![sonos-system_pressekit.jpg](sonos-system_pressekit.jpg?raw=true "sonos-system_pressekit.jpg")

This script is a classic Linux bash script, that i use to restart my two Sonos play:1 speakers at 4:50am every Monday. This bash script uses the "hidden" Sonos web interface on port 1400. :+1:

Have fun & good luck!

## Sonos 9.3

Sonos removes with firmware 9.3 the reboot url on the "hidden" web interface. Sorry! :disappointed_relieved: 

:exclamation: The script does not work anymore. [Thread @reddit](https://www.reddit.com/r/sonos/comments/a1x0f7/sonos_reboot_url_disabled/) 

## Download

```
wget https://raw.githubusercontent.com/nicoh88/cron_sonos-reboot/master/cron_sonos-reboot.sh
chmod 700 cron_sonos-reboot.sh
```

## Usages

### Terminal / Bash

`./cron_sonos-reboot.sh 192.168.1.40 192.168.1.41`

```
Reboot of 192.168.1.40 (CSRFToken: g8mlBFoxeBUTcABWF4LWgD3SsxwUF89l) successful.
Reboot of 192.168.1.41 (CSRFToken: GOd8xFfpxWG/cNieUmlABLrL0N7SVavL) successful.
```

### Crontab

`vi /etc/crontab`

```
# Sonos speaker weekly reboot
50 4 * * 1 root /root/Scripts/cron_sonos-reboot.sh 192.168.1.40 192.168.1.41
```
