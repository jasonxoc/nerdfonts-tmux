#!/usr/bin/env bash

# # # # # # # # # #
# Orginal Author: Jason Cox <jasonxoc@gmail.com> https://www.linkedin.com/in/jason-cox-98444748/
# Date: 7/11/2019
# Rep: https://github.com/jasonxoc/nerdfonts-tmux
#
# Notes: This is made for me, uses macos commands
#      : Search: https://www.nerdfonts.com/cheat-sheet
#
# # # # # # # # # #


feature_db=1
feature_mvc=1
feature_force=1
feature_debug=0

window_number="$1"
window_name="$2"
session_name="$3"
active_window="$4"
unique_name="${session_name}-${window_number}"


# Vim
vim_icon=""
vim_box_icon=""

# Configuration
conf_icon_active=""
conf_icon=""

# Languages
python_icon=""
ruby_icon=""
java_icon=""
js_icon=""
php_icon=""
php_icon_alt=""
css_icon=""
dotnet_icon=""
dotnet_icon_alt=""
xml_icon=""
html_icon=""
html_icon_alt=""
node_icon=""

# Frameworks
magento_icon=""
rails_icon=""
rails_icon_alt=""

# Platforms
apple_icon=""
windows_icon=""
windows_icon_alt=""
linux_icon=""
debian_icon=""
ubuntu_icon=""
ubuntu_icon_alt=""
android_icon=""
android_icon_alt=""
aws_icon=""
aws_icon_alt=""
angular_icon=""
bing_icon=""
bootstrap_icon=""
bash_icon=""


finder_icon=""
finder_icon_alt=$apple_icon

# Chat / Messaging
discord_icon="ﭮ"
discord_icon_alt=""
discord_icon_alt_active=""
discord_icon=$discord_icon_alt
discord_icon_active=$discord_icon_alt_active
chat_icon=""
chat_unread_icon=""
gmail_icon=""
mail_icon=""
mail_unread_icon="ﯬ"
irc_icon=""
irc_icon_active=""

irc_unread_icon=""

# Version Control
git_sync_icon=""
git_face_icon=""
git_commit_icon=""
git_icon=""

# Dbs
pgsql_icon=""
mysql_icon=""
db_icon=""
redis_icon=""
solr_icon=""
mongo_icon=""

# Shell
ssh_icon_active=""
ssh_icon=""
sh_icon=""
sh_icon_active=""

# Media
music_icon=""
music_icon_alt=""
photos_icon="ﯛ"
photos_icon_alt=""

# Coding
devcode_icon=""
log_icon=""

model_icon=""
model_icon_alt=""
controller_icon=""
controller_icon_alt=""
controller_icon_alt=""

view_icon=""
view_icon_alt="ﰦ"
templates_icon=""

# Random Icons
home_icon=""
apps_icon=""
atom_icon=""
box_bracket_icons=""
atlassian_icon=""
firefox_icon=""
flame_icon=""
ionic_icon=""
keys_icon=""
desktop_icon=""
box_icon=""
box_icon_active=""
braces_icon=""
brackets_icon=""
parenthesis_icon=""
tags_icon=""
cloud_icon=""
cloud_icon_active=""
chart_icon=""
iris_icon=""
bomb_icon="ﮏ"
blur_icon=""
biohazard_icon=""
television_icon=""
building_icon=""
infinity_icon="﮼"
rightarrow_icon=""
leftarrow_icon=""
evernote_icon=""

if [[ $active_window -gt 0 ]]; then
    sh_icon=$sh_icon_active
    ssh_icon=$ssh_icon_active
    conf_icon=$conf_icon_active
    irc_icon=$irc_icon_active
    discord_icon=$discord_icon_active
fi

icons=$sh_icon
[[ $window_name == "git" ]] && window_name="$git_icon $window_name"

# Python Environments
if [[ $window_name == "e:"* ]] || [[ $window_name == "e-"* ]]; then
   vim_icon=${vim_box_icon}
   icons="$python_icon $icons"
fi


# SSH
if [[ $window_name == *"ssh"* ]]; then
    vim_icon=${vim_box_icon}
    icons="${ssh_icon}"
    [[ $window_name == "e:"* ]] || [[ $window_name == "e-"* ]] && icons="${python_icon} ${ssh_icon}"
fi


# Databases
if [[ ! -z $feature_db ]]; then
    if [[ $window_name == *"pgsql"* ]] || [[ $window_name == *"postgres"* ]] || [[ $window_name == *"psql"* ]]; then
        icons="${icons} ${db_icon} ${pgsql_icon}"
    elif [[ $window_name == *"mysql"* ]]; then
        icons="${icons} ${db_icon} ${mysql_icon}"
    elif [[ $window_name == *"db" ]]; then
        icons="${db_icon} $icons"
    fi
    [[ $window_name == *"solr"* ]] && icons="${icons} ${solr_icon}"
    [[ $window_name == *"redis"* ]] && icons="${icons} ${redis_icon}"
    [[ $window_name == *"mongo"* ]] && icons="${icons} ${mongo_icon}"
fi


# Editors
[[ $window_name == *"vim"* || $window_name == *"vi" ]] && icons="${icons} ${vim_icon}"

# Chat / Messaging
if [[ $window_name == *"discord"* ]] || [[ $window_name == *"dscd"* ]]; then
    icons="${icons} ${discord_icon}"
elif [[ $window_name == *"irc"* ]] || [[ $window_name == *" chat"* ]] || [[ $window_name == *"chat" ]]; then
    icons="${icons} ${chat_icon}"
fi

# File Managers
[[ $window_name == *"rngr"* || $window_name == *"ranger" ]] && icons="${icons} ${finder_icon}"

# Code / Configurations
[[ $window_name == *" code" || $window_name == "code" ]] && icons="${icons} ${devcode_icon}"
[[ $window_name == *" log" || $window_name == *"logs" ]] && icons="${icons} ${log_icon}"
[[ $window_name == *"conf" || $window_name == *"etc"* || $window_name == *"dotfiles" || $window_name == *" conf"* ]] && icons="${icons} ${conf_icon}"

# Languages:
[[ $window_name == *"nvm"* || $window_name == *"node" ]] && icons="${icons} ${node_icon}"
[[ $window_name == *"js"* || $window_name == *"javascript"* ]] && icons="${icons} ${js_icon}"

[[ $window_name == *"java"* ]] && icons="${icons} ${java_icon}"
[[ $window_name == *"ruby"* ]] && icons="${icons} ${ruby_icon}"
[[ $window_name == *"rails" ]] && icons="${icons} ${ruby_icon}"
[[ $window_name == *"php"* ]] && icons="${icons} ${php_icon}"
[[ $window_name == *"css"* || $window_name == *"style" ]] && icons="${icons} ${css_icon}"
[[ $window_name == *".sh"* ]] && icons="${icons} ${bash_icon}"

# MVC Coding
if [[ ! -z $feature_mvc ]]; then
    [[ $window_name == *"model"* || $window_name == *" mdl"* ]] && icons="${icons} ${mode_icon}"
    [[ $window_name == *" cont"* || $window_name == *"controller"* ]] && icons="${icons} ${controller_icon}"
    [[ $window_name == *"tpl"* || $window_name == *" view"* || $window_name == *"html"* ]] && icons="${icons} ${view_icon}"
fi

# Platforms
[[ $window_name == *"aws" || $window_name == *"amzn"* ]] && icons="${icons} ${aws_icon}"

# Force window name
# ~/.tmux_window_names: search|replace
force_window_name=""
if [ ! -z $feature_force ]; then
    force_window_name=""
    if [ -f ~/.tmux_window_names ]; then
        while read test_window_name;
        do
            test_string="$(echo $test_window_name | awk -F'|' '{print $1}')"
            [[ $window_name == $test_string ]] && force_window_name="$(echo $test_window_name | awk -F'|' '{print $2}')"
        done < ~/.tmux_window_names
    fi
fi

[[ ! -z $force_window_name ]] && window_name=$force_window_name || window_name="$icons $window_name"

[[ $feature_debug -gt 0 ]] && \
    echo "win number: $window_number win name: $window_name session name: $session_name active: $active_window : ${window_name}" >> /tmp/tmux_debug.txt

echo $window_name

