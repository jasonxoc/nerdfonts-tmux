nerdfonts_ enabled tmux_
========================

NOTE: This is only tested on Khali linux and MacOS.
Set of scripts that styles tmux using nerdfonts.

(Search for new glyphs)[https://www.nerdfonts.com/cheat-sheet]

You can customize your own session names and window names
by creating a ~/.tmux_session_names and ~/.tmux_window_names

Note: These glyphs don't show up on the web


Examples
:: ~/.tmux_session_names

   project| project

:: ~/.tmux_window_names

   tmux conf| tmux conf


I just open up the nerdfonts_ website and search for glyphs to style tmux windows and sessions

These are my personalized scripts.
I use macos, so all of the tmux_right_icons.sh are tested using macos 10.14.4
If you have a distro, add it in bin/tmux_right_icons{platform_name}.sh and I'll merge it.


Setup
-----

I compiled the latest release of tmux_ from source. Version: 3.1
I don't think you need to for this...

* Link or copy the files from bin/ to ~/bin/
  mkdir -p ~/bin
  ln -s $(pwd)/bin/tmux_date.sh ~/bin/tmux_date.sh
  ln -s $(pwd)/bin/tmux_user.sh ~/bin/tmux_user.sh
  ln -s $(pwd)/bin/tmux_opts.sh ~/bin/tmux_opts.sh
  ln -s $(pwd)/bin/tmux_window_name.sh ~/bin/tmux_window_name.sh
  ln -s $(pwd)/bin/tmux_session_name.sh ~/bin/tmux_session_name.sh
  ln -s $(pwd)/bin/tmux_right_icons.sh ~/bin/tmux_right_icons.sh
* Make sure ~/bin is in your $PATH : export PATH=$PATH:~/bin
  echo 'export PATH=$PATH:~/bin' >> ~/.bash_profile

* Use the tmux.conf file provided:
  mv ~/.tmux.conf ~/.tmux.conf.old
  cp tmux.conf ~/.tmux.conf
  OR
  ln -s $(pwd)/tmux.conf ~/.tmux.conf

* Or combine your existing ~/.tmux.conf with the one here.
  The status-left, status-right and window-status items call the scripts.
  Change them to whereever you put the shell scripts

   * If you have more than one pair of airpods then this could help.
     At the bottom of tmux_right_icons.sh tmux_right_icons_macos.sh there's a string search
     for your airpod name and if it matches it puts an icon next to the headphone glyph

* cp tmux_session_names ~/.tmux_session_names (if you want to easily style your
  session names)
* cp tmux_window_names ~/.tmux_window_names (this completely replaces the window
  name with whatever you put in here. Meaning it will ignore the other substring
  matches that tmux_window_name.sh does)


Let me know what you come up with
---------------------------------

I don't ever put code up on github but I wanted to share it with @christoomey and @changemewtf (Chris and Max)
So forgive whatever dumb stuff I did on these.

If anyone finds it useful, let me know what you come up with.

Jason Cox<jasonxoc@gmail.com> https://www.linkedin.com/in/jason-cox-98444748/

.. _tmux: https://github.com/tmux/tmux
.. _nerdfonts: https://www.nerdfonts.com/


Blink-SH Nerdfont
-----------------

Blink SH is a terminal emulator for ios and it supports uploading fonts. I wasn't able to find a
base64 encoded css mono nerdfont patched font that worked with blinksh.

It ended up being hyper irritating. So for your convienience:

* Literation Mono Nerd Font: LiterationTTF_
- font/Literation\ Mono\ Nerd\ Font\ Complete\ Mono.ttf

* BlinkSH supported Nerdfont base64 encoded in CSS: LiterationCss_
- blink-sh/LiterationMonoNerdFont.css

* On MacOS double click the font in the font dir
  OR
  cp fonts/*.ttf ~/Library/Fonts/

.. _LiterationCss: https://raw.githubusercontent.com/jasonxoc/nerdfonts-tmux/master/blink-sh/LiterationMonoNerdFont.css
.. _LiterationTTF: https://github.com/jasonxoc/nerdfonts-tmux/blob/master/fonts/Literation%20Mono%20Nerd%20Font%20Complete%20Mono.ttf?raw=true


Notes about the image / other random notes
------------------------------------------

* Shows an icon that represents the charge of your battery
* I put a bunch of default window icon representations in tmux_window_name.sh
* You see an example of being sshed into a server, it has a different sh icon
* The bash window is the default shell icon
* There are different active state glyphs used when it felt better to me
* You'll notice on the ssh mysql1 tab that the window is ssh'ed into a db server that's mysql
* vim tmux scripts window shows that it's running vim
* It does this only by the window name that you set using C-,
* For python virtual environments if you name your window something like e: vim settings it will show
  a python virtual environment glyph before the shell glyph indicating that you're in a venv
  followed by the vim glyph


Example Image
-------------

.. image:: https://github.com/jasonxoc/nerdfonts-tmux/raw/master/example_img/nerdfonts-tmux.png



