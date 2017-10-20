set -x
set -e

error() {
  awk " BEGIN { print \"$@\" > \"/dev/fd/2\" }"
  exit 1
}

if [ -z $SSID ]; then
  error "SSID not found"
fi

if [ -z $PASSWORD ]; then
  error "PASSWORD not found"
fi

# if [ -z $NIC ]; then
#   error "NIC not found"
# fi

cat > network.conf <<EOF
ctrl_interface=/var/run/wpa_supplicant
network={{
    ssid=$SSID
    key_mgmt=FT-PSK
    psk=$PASSWORD
    ap_scan=0
}}
EOF
ifconfig
# wpa_supplicant -D nl80211 -i eth0 -c network.conf
wpa_supplicant -D wired -i eth0 -c network.conf
