#!/usr/bin/env sh
chars_per_line="$(tput cols)"
char_thresh=144

if [ $chars_per_line -gt $char_thresh ]; then
    date_time=" $(date '+%a %m/%d%l:%M')"
    echo $date_time
else
    #date_time=" $(date '+%a %l:%M')"
    date_time=" $(date '+%a %l:%M')"
    echo $date_time
fi
