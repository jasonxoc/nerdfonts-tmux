#!/usr/bin/env sh
# Orginal Author: Jason Cox <jasonxoc@gmail.com> https://www.linkedin.com/in/jason-cox-98444748/
# Date: 7/11/2019
# Notes: This is made for me, uses macos commands
#
# battery_icons:            
# plug_icons: ﮣ ﮣ
#
#
# Headphone Icons:    
#
# Key Icon: 
# Airpod box icon: ﯀  
#
##

if [ -f /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport ]; then
    airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
    wifi_ssid="$($airport --getinfo |grep ' SSID:' |awk '{print $2}')"
    batt_txt_mod="$(stat -t +%s $batt_txt_file | awk '{print $10}' | sed 's/[^0-9]//g' )"
    audio_txt_mod="$(stat -t +%s $audio_txt_file | awk '{print $10}' | sed 's/[^0-9]//g' )"
elif [ ! -z $(which nmcli) ]; then
    airport=$(which nmcli)
    wifi_ssid="$(${airport} -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2)"
    batt_txt_mod=""
    audio_txt_mod=""
fi
now="$(date +%s)"
batt_txt_sec_mod="$(expr $now - $batt_txt_mod)"
audio_txt_sec_mod="$(expr $now - $audio_txt_mod)"
audio_txt_file=/tmp/tmux_audio.txt
batt_txt_file=/tmp/tmux_batt.txt
refresh=10

vpn_icon=""
on_vpn="$(ifconfig | grep 'utun1')"

if [[ "x" == "${on_vpn}x" ]]; then
    vpn_icon=""
else
    vpn_icon=" "
fi

function update_batt_txt {
    pmset -g batt > /tmp/tmux_batt.txt
}

if [ ! -f $batt_txt_file ] || [ $batt_txt_sec_mod -gt $refresh ] ; then
    update_batt_txt
fi

function update_audio_txt {
    system_profiler SPAudioDataType > /tmp/tmux_audio.txt
    system_profiler SPBluetoothDataType > /tmp/tmux_bluetooth.txt
}

if [ ! -f $audio_txt_file ] || [ $audio_txt_sec_mod -gt $refresh ]; then
    update_audio_txt
fi

plug_status="$(cat $batt_txt_file |grep 'AC Power')"
percentage="$(cat $batt_txt_file | grep 'InternalBattery' |awk '{print $3}' | sed 's/[^0-9]//g')"
batt_icon=""
power_plug_icon=""
unread_msg_icon="﬐"
unread_chats=0

#echo "Bat Perc: $percentage" >> /tmp/batt

if [[ $percentage -lt 11 ]]; then
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
elif [[ $percentage -gt 99 ]]; then
    batt_icon=""
fi


if [ -z $plug_status ]; then
    power_icons=" ${power_batt_icon} ${batt_icon}"
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
    elif [[ $percentage -gt 99 ]]; then
        batt_icon="ﴅ"
    fi

    power_icons=" ${power_plug_icon} ${batt_icon}"
fi

network_icon=" "
if [[ "${wifi_ssid}x" == "x" ]]; then
    network_icon=""
fi
#  
#wifi_ssid="Voice"
echo $wifi_ssid > /tmp/wifi_ssid
if [[ $wifi_ssid == "Voice" ]]; then
    network_icon="$network_icon "
fi
if [[ $wifi_ssid == "Connectio.us" ]]; then
    network_icon="$network_icon "
fi

if [[ $wifi_ssid == "Jasons" ]]; then
    network_icon="$network_icon "
fi

chats_icons=""
if [ $unread_chats -gt 0 ]; then
    chats_icons=$unread_msg_icon
fi

# ioreg
# "BTTTYName" = "JasonsAirPodsKeys

#    
# 
#   
#   
headphone_icons=""

output_device="$(cat $audio_txt_file |grep 'Default Output Device' -B3 |grep -v 'Default Output' |grep ':')"
if [[ $output_device == *'Pods'* ]]; then
    if [[ $output_device == *'Keys'* ]]; then
        headphone_icons="  "
    fi
    if [[ $output_device == *'Lose'* ]]; then
        headphone_icons="  "
    fi
fi


if [ ! -z $chats_icons ]; then
    echo "${power_icons}${vpn_icon}${network_icon}${chats_icons}${headphone_icons}"
else
    echo "${power_icons}${vpn_icon}${network_icon}${headphone_icons}"
fi


