#!/usr/bin/env sh

# # # # # # # # # #
# Orginal Author: Jason Cox <jasonxoc@gmail.com> https://www.linkedin.com/in/jason-cox-98444748/
# Date: 7/11/2019
# Rep: https://github.com/jasonxoc/nerdfonts-tmux
#
# Notes: This is made for me, uses macos commands
#
# # # # # # # # # #

session_name="$1"
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
