nerdfonts_ enabled tmux_
========================

Set of scripts that styles tmux using nerdfonts.

You can customize your own session names and window names
by creating a ~/.tmux_session_names and ~/.tmux_window_names

Example ~/.tmux_session_names
-----------------------------
project| project

Example ~/.tmux_window_names
----------------------------
tmux conf| tmux conf

I just open up the nerdfonts_ website and search for glyphs to style tmux windows and sessions


These are my personalized scripts.
I use macos, so all of the right_icons_macos.sh are tested using macos 10.14.4
If you have a distro, add it in bin/right_icons_platform.sh and I'll merge it.


Setup
-----

* Copy the files from bin/ to ~/bin/
* Combine your existing ~/.tmux.conf with the one here
  - The status-left, status-right and window-status items call the scripts
  - Change them to whereever you put the shell scripts


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

It ended up being hyper irritating.

So for your convienience:

Literation Mono Nerd Font:
font/Literation\ Mono\ Nerd\ Font\ Complete\ Mono.ttf

Base64 encoded in CSS:
blink-sh/LiterationMonoNerdFont.css





Image
-----


.. image:: https://github.com/jasonxoc/nerdfonts-tmux/raw/master/example_img/nerdfonts-tmux.png



