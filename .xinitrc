#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Added to let Qt know about the GTK+ theme
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec startxfce4
