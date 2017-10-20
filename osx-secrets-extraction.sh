NIC=en0
SSID=$(networksetup -getairportnetwork $NIC)
PASSWORD=$(security find-generic-password -ga $SSID)
