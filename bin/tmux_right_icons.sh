#!/usr/bin/env bash

# # # # # # # # # #
# Orginal Author: Jason Cox <jasonxoc@gmail.com> https://www.linkedin.com/in/jason-cox-98444748/
# Date: 7/11/2019
# Rep: https://github.com/jasonxoc/nerdfonts-tmux
#
# Notes: This is made for me, uses macos commands
#      : Icon Search: https://www.nerdfonts.com/cheat-sheet

#
# # # # # # # # # #
#  
# battery_icons:            
# plug_icons: ﮣ ﮣ
# Headphone Icons:        
# Key Icon:    
# Airpod box icon: ﯀  
# SSH Icons:  
#
# stat -t +%s /tmp/tmux_audio.txt
# 16777221 17652346 -rw-r--r-- 1 user group 0 1343 "+1563656887" "+1563656874" "+1563656874" "+1563561273" 4096 8 0 /tmp/tmux_audio.txt
#    ??       ??                                         mod?          upd?        upd?         create?
#
# This could work for linux?
#if [ -f $(which nmcli) ]; then
#    airport=$(which nmcli)
#    wifi_ssid="$(${airport} -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2)"
#    batt_txt_mod="$(stat -t +%s $batt_txt_file | awk '{print $10}' | sed 's/[^0-9]//g' )"
#    audio_txt_mod="$(stat -t +%s $audio_txt_file | awk '{print $10}' | sed 's/[^0-9]//g' )"
#fi
#
##

aws_icon=""
conf_icon=""
work_wifi_icon=""
home_wifi_icon=""

batt_icon=""
power_plug_icon=""
unread_msg_icon="﬐"
vpn_icon=""

network_icon=""

# Show hostname of server sshed scrolling
HOSTNAME_MAX_LENGTH=25
HOSTNAME=$(hostname)
HOSTNAME_FILEVAR=/tmp/tmux_hostname.txt
# Test if we're ssh'ed into a server
if [[ ! -z $SSH_CLIENT ]]; then
    [[ ! -f $HOSTNAME_FILEVAR ]] && echo "$(hostname)" > $HOSTNAME_FILEVAR
    TMUX_HOSTNAME=$(cat $HOSTNAME_FILEVAR)
    TMUX_HOSTNAME_LENGTH=${#TMUX_HOSTNAME}
    HOSTNAME_LENGTH=${#HOSTNAME}
    TMUX_HOSTNAME_STR=$TMUX_HOSTNAME
    if [[ $HOSTNAME_LENGTH -gt $HOSTNAME_MAX_LENGTH ]]; then
        if [[ $TMUX_HOSTNAME_LENGTH -gt $HOSTNAME_MAX_LENGTH ]]; then
            TMUX_HOSTNAME_SUBSTR=$(echo $TMUX_HOSTNAME |cut -c2-${HOSTNAME_LENGTH})
            TMUX_HOSTNAME_STR=$(echo $TMUX_HOSTNAME | cut -c2-${HOSTNAME_MAX_LENGTH})
        else
            TMUX_HOSTNAME_SUBSTR=$(echo $HOSTNAME |cut -c1-${HOSTNAME_LENGTH})
            TMUX_HOSTNAME_STR=$(echo $HOSTNAME | cut -c1-${HOSTNAME_MAX_LENGTH})
        fi
    fi
    HOSTNAME_ICONS=""
    [[ $HOSTNAME == *".compute.internal" ]] && HOSTNAME_ICONS="${HOSTNAME_ICONS} ${aws_icon}"
    echo "${HOSTNAME_ICONS} ${TMUX_HOSTNAME_STR}"
    echo $TMUX_HOSTNAME_SUBSTR > $HOSTNAME_FILEVAR
    exit
fi


home_wifi_ssid="$1"
work_wifi_ssid="$2"

feature_airpods=0

echo "arg1: ${home_wifi_ssid} arg2: ${work_wifi_ssid}" > /tmp/tmux_args.txt


audio_txt_file=/tmp/tmux_audio.txt
batt_txt_file=/tmp/tmux_batt.txt

if [ -f /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport ]; then
    airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
    wifi_ssid="$($airport --getinfo |grep ' SSID:' |awk -F':' '{print $2}')"
    batt_txt_mod="$(stat -t +%s $batt_txt_file | awk '{print $10}' | sed 's/[^0-9]//g' )"
    audio_txt_mod="$(stat -t +%s $audio_txt_file | awk '{print $10}' | sed 's/[^0-9]//g' )"
fi

now="$(date +%s)"
batt_txt_sec_mod="$(expr $now - $batt_txt_mod)"
audio_txt_sec_mod="$(expr $now - $audio_txt_mod)"
refresh=15

on_vpn="$(ifconfig | grep 'utun1')"
[[ -z "$on_vpn" ]] && vpn_icon="" || vpn_icon=" "

function update_batt_txt {
    [ command -v pmset >/dev/null ] && pmset -g batt > /tmp/tmux_batt.txt
}

if [ ! -f $batt_txt_file ] || [ $batt_txt_sec_mod -gt $refresh ] ; then
    update_batt_txt
fi

function update_audio_txt {
    if [ command -v system_profiler >/dev/null ]; then
        system_profiler SPAudioDataType > /tmp/tmux_audio.txt
        system_profiler SPBluetoothDataType > /tmp/tmux_bluetooth.txt
    fi
}

if [ ! -f $audio_txt_file ] || [ $audio_txt_sec_mod -gt $refresh ]; then
    update_audio_txt
fi

if [ -f $batt_txt_file ]; then
    plugged_in="$(cat $batt_txt_file |grep 'AC Power')"
    percentage="$(cat $batt_txt_file | grep 'InternalBattery' |awk '{print $3}' | sed 's/[^0-9]//g')"
else
    plugged_in=""
    percentage=""
fi

unread_chats=0

#echo "Bat Perc: $percentage" >> /tmp/batt

if [[ $percentage -lt 1 ]]; then
    batt_icon=""
elif [[ $percentage -lt 11 ]]; then
    batt_icon=""
elif [[ $percentage -lt 21 ]]; then
    batt_icon=""
elif [[ $percentage -lt 41 ]]; then
    batt_icon=""
elif [[ $percentage -lt 61 ]]; then
    batt_icon=""
elif [[ $percentage -lt 81 ]]; then
    batt_icon=""
elif [[ $percentage -lt 91 ]]; then
    batt_icon=""
elif [[ $percentage -lt 99 ]]; then
    batt_icon=""
elif [[ $percentage -gt 99 ]] || [[ $percentage -eq 99 ]]; then
    batt_icon=""
fi


if [[ "${plugged_in}x" == "x" ]]; then
    power_icons=" ${batt_icon}"
else
    if [[ $percentage -lt 21 ]]; then
        batt_icon=""
    elif [[ $percentage -lt 41 ]]; then
        batt_icon=""
    elif [[ $percentage -lt 61 ]]; then
        batt_icon=""
    elif [[ $percentage -lt 81 ]]; then
        batt_icon=""
    elif [[ $percentage -lt 91 ]]; then
        batt_icon=""
    elif [[ $percentage -lt 99 ]]; then
        batt_icon=""
    elif [[ $percentage -gt 99 ]] || [[ $percentage -eq 99 ]]; then
        batt_icon="ﴅ"
    fi
    power_icons=" ${power_plug_icon} ${batt_icon}"
fi

if [[ "${wifi_ssid}x" == "x" ]]; then
    network_icon=""
fi

#echo "Wifi ssid (without single quotes): '${wifi_ssid}'" > /tmp/wifi_ssid
if [[ $wifi_ssid == *"$work_wifi_ssid" ]]; then
    network_icon="${network_icon} ${work_wifi_icon}"
elif [[ $wifi_ssid == *"$home_wifi_ssid" ]]; then
    network_icon="${network_icon} ${home_wifi_icon}"
fi

chats_icons=""
if [ $unread_chats -gt 0 ]; then
    chats_icons=$unread_msg_icon
fi

headphone_icons=""
output_device="$(cat $audio_txt_file |grep 'Default Output Device' -B3 |grep -v 'Default Output' |grep ':')"
if [[ $output_device == *'Pods'* ]]; then
    headphone_icons=" "
    #if [[ $output_device == *'Keys'* ]]; then
    #    headphone_icons="  "
    #elif [[ $output_device == *'Lose'* ]]; then
    #    headphone_icons="  "
    #fi
fi


if [ ! -z $chats_icons ]; then
    echo "${power_icons}${vpn_icon}${network_icon}${chats_icons}${headphone_icons}"
else
    echo "${power_icons}${vpn_icon}${network_icon}${headphone_icons}"
fi


