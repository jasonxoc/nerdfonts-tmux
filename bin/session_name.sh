#!/usr/bin/env sh
#chars_per_line="$(tput cols)"
#char_thresh=145
#
#if [ $chars_per_line -lt $char_thresh ]; then
#
#else
#
#fi

session_name="$1"
# term:    ﬑  
sh_icon=""
ssh_icon=""
vim_icon=""
conf_icon=""
ssh_icon=""
python_icon=""
icons=$sh_icon
return_string=$session_name
if [ -f ~/.tmux_session_names ]; then
    while read session_row;
    do
        test_string="$(echo $session_row | awk -F',' '{print $1}')"
        if [[ $session_name == $test_string ]]; then
            return_string="$(echo $session_row | awk -F',' '{print $2}')"
        fi
    done < ~/.tmux_session_names
fi
if [[ "${return_string}x" == "x" ]]; then
    return_string="${session_names}"
fi
echo "$return_string"
