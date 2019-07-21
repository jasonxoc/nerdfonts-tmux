#!/usr/bin/env sh

# # # # # # # # # #
# Orginal Author: Jason Cox <jasonxoc@gmail.com> https://www.linkedin.com/in/jason-cox-98444748/
# Date: 7/11/2019
# Rep: https://github.com/jasonxoc/nerdfonts-tmux
#
# Notes: This is made for me, uses macos commands
#        I want to try to see how many cols the term has
#        and if theres enough room, display the large date
#        I think I need to execute `tput cols` inside of tmux
#        and pass it in as an argument becuase these scripts run
#        in shell level 3 rather than 2...
#
# # # # # # # # # #

cars_per_line="$(tput cols)"

date_time=" $(date '+%a %l:%M')"
date_time_aux=" $(date '+%a %m/%d%l:%M')"
echo $date_time
