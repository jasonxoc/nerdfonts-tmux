nerdfonts_ enabled tmux_
========================

Set of scripts that styles tmux using nerdfonts.

You can customize your own session names and window names
by creating a ~/.tmux_session_names and ~/.tmux_window_names

Note: These glyphs don't show up on the web

Example ~/.tmux_session_names
-----------------------------
project| project

Example ~/.tmux_window_names
----------------------------
tmux conf| tmux conf


I just open up the nerdfonts_ website and search for glyphs to style tmux windows and sessions

These are my personalized scripts.
I use macos, so all of the right_icons_macos.sh are tested using macos 10.14.4
If you have a distro, add it in bin/right_icons_{platform_name}.sh and I'll merge it.


Setup
-----

I compiled the latest release of tmux_ from source. Version: 3.1
I don't think you need to for this...

* Copy the files from bin/ to ~/bin/
* Make sure ~/bin is in your $PATH : export PATH=$PATH:~/bin
* Combine your existing ~/.tmux.conf with the one here
  * The status-left, status-right and window-status items call the scripts
  * Change them to whereever you put the shell scripts
* Update ~/bin/right_icons_macos.sh
  * Change work_wifi_ssid and home_wifi_ssid to your work and home wifi name
  * The script spits out your ssid to /tmp/wifi_ssid
* If you have more than one pair of airpods then this could help
  * At the bottom of right_icons.sh right_icons_macos.sh there's a string search
    for your airpod name and if it matches it puts an icon next to the headphone glyph

Let me know what you come up with
---------------------------------

Let me know what you come up with. Hopefully this should get you started customzing tmux

If anyone wants me to, I can create an install.sh that installs the latest tmux, nerdfonts,
walks you thorugh customizing and automatically adjusts your tmux.conf

Jason Cox<jasonxoc@gmail.com> https://www.linkedin.com/in/jason-cox-98444748/


.. _tmux: https://github.com/tmux/tmux
.. _nerdfonts: https://www.nerdfonts.com/


Blink-SH Nerdfont
-----------------

Blink SH is a terminal emulator for ios and it supports uploading fonts. I wasn't able to find a
base64 encoded css mono nerdfont patched font that worked with blinksh.

It ended up being hyper irritating. So for your convienience:

Literation Mono Nerd Font:
font/Literation\ Mono\ Nerd\ Font\ Complete\ Mono.ttf

Base64 encoded in CSS:
blink-sh/LiterationMonoNerdFont.css





Image
-----


.. image:: https://github.com/jasonxoc/nerdfonts-tmux/raw/master/example_img/nerdfonts-tmux.png



