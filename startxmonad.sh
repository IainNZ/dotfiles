#!/bin/bash
xrandr --output HDMI-1 --auto --above LVDS-1
xrandr --output LVDS-1 --primary
stalonetray &
nm-applet &
dropbox start
exec xmonad
