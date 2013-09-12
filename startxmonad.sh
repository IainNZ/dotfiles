#!/bin/bash
stalonetray &
nm-applet &
dropbox start
exec xmonad
