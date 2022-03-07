#!/bin/zsh
# ----------------------------
#	FILE:	032_find_for_PE_sed_name_change.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	./032... 1
#   PURPOSE:  	find for PE change names ... {} \;
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------


## REF:  https://askubuntu.com/questions/425583/ubuntu-connect-drops-worked-for-a-while-then-started-dropping-again/425617#425617

## https://gist.githubusercontent.com/archy-bold/9a4cdee49309e4a2d059c900362fa9dc/raw/8cdf5341acbfddf41387a8f926804b3ed6001e95/set-access-point.sh

# Usage: ./set-access-points.sh [network SSID] [network interface id = wlan0]

# Read in the arguements
ssid=$1;
interface=$2;

# SSID is required
if [ -z "$ssid" ]; then
	echo "ERROR: Arguement 1, SSID, is required"
	exit 1
fi

# If there's no interface supplied, default to wlan0
if [ -z $interface ]; then
	interface="wlan0"
fi

output=$(sudo iwlist $interface scan 2>&1)

# Get the number of lines of output
nl=$(echo -n "$output" | grep -c '^')

if [ $nl -eq 1 ]; then
	echo "ERROR: $output"
	echo "ERROR: The interface may not exist"
	exit 1
fi

# Arrays to store the networks
declare -a network_quality
declare -a network_quality2
declare -a network_macs
num_networks=0

while IFS= read -r line; do

    ## Test line content and parse as required
    [[ "$line" =~ Address ]] && mac=${line##*ss: }
    [[ "$line" =~ Quality ]] && {
        qual=${line##*ity=}
		qual2=${qual%% *}
		qual=${qual%%\/*}
    }
    [[ "$line" =~ ESSID ]] && {
        essid=${line##*ID:\"}
		essid="${essid%\"}"
		# Add to the arrays after ESSID
		if [ "$essid" = "$ssid" ]; then
			network_quality[$num_networks]=$qual
			network_quality2[$num_networks]=$qual2
			network_macs[$num_networks]=$mac
			num_networks=$((num_networks+1))
		fi
    }

done <<< "$output"

if [ $num_networks -eq 0 ]; then
	echo "ERROR: No networks found for SSID \"$ssid\""
	exit 1
fi

echo "Found $num_networks access point(s) for network \"$ssid\""

highest_idx=0

# Find the highest quality
for i in ${!network_quality[*]}; do
	if [ ${network_quality[$i]} -gt ${network_quality[$highest_idx]} ]; then
		highest_idx=$i
	fi
done

# Found the best strength, now ask if they want to connect.
mac=${network_macs[$highest_idx]}
qual=${network_quality2[$highest_idx]}
while true; do
    read -p "Do you want to set the Wi-Fi BSSID property of \"$ssid\" to \"$mac\" with the strength $qual? " yn
    case $yn in
        [Yy]* ) nmcli c modify "$ssid" 802-11-wireless.bssid "$mac"; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Done. Do you want to reconnect to network \"$ssid\"? " yn
    case $yn in
        [Yy]* ) nmcli c up "$ssid"; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
