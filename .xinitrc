#!/usr/bin/sh

# Editor
export EDITOR="nvim"

# XDG / session info
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESSION_DESKTOP=dwm
export XDG_SESSION_TYPE=x11
export GTK_USE_PORTAL=1

# Background
feh --bg-scale "$HOME/Pictures/BG.jpg" &

# Sync environment to systemd user session
systemctl --user import-environment DISPLAY XDG_CURRENT_DESKTOP
[ -n "$XAUTHORITY" ] && systemctl --user import-environment XAUTHORITY
[ -n "$DISPLAY" ] && systemctl --user import-environment DISPLAY

# Restart portal so it sees DISPLAY
systemctl --user restart xdg-desktop-portal

dwmblocks &

#/usr/bin/opensnitch-ui &
# Start dwm
exec dwm
