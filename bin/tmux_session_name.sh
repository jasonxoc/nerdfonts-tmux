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


session_name="$1"
feature_debug=1
feature_force=1

[[ ! -z $feature_debug && $feature_debug -gt 0 ]] && echo "session name: $session_name" >> /tmp/tmux_debug.txt

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



# Force session name
# ~/.tmux_session_names: search|replace
session_name_str=$session_name
if [ ! -z $feature_force ]; then
    force_session_name=""
    if [ -f ~/.tmux_session_names ]; then
        while read test_session_name;
        do
            test_string="$(echo $test_session_name | awk -F'|' '{print $1}')"
            [[ $session_name == $test_string ]] && force_session_name="$(echo $test_session_name | awk -F'|' '{print $2}')"
        done < ~/.tmux_session_names
    fi
    [[ ! -z $force_session_name ]] && session_name_str=$force_session_name
fi

echo $session_name_str

