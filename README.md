# cron_sonos-reboot - Sonos speaker reboot bash script - every day, once a week, as you like.

## quick 'n dirty scripting

![sonos-system_pressekit.jpg](sonos-system_pressekit.jpg?raw=true "sonos-system_pressekit.jpg")

Bei diesem Skript handelt es sich um ein klassisches Linux Bash-Skript, welches ich verwende um jeden Montag, um 4:50, meine 2 Sonos Play:1 neuzustarten. Dieses Bash-Skript nutzt das "versteckte" Sonos-Webinterface auf Port 1400. :+1:

This script is a classic Linux bash script, that i use to restart my two Sonos play:1 speakers at 4:50am every Monday. This bash script uses the "hidden" Sonos web interface on port 1400. :+1:

Have fun & good luck!

## Usages

### Terminal / Bash

`/cron_sonos-reboot.sh 192.168.1.40 192.168.1.41`

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