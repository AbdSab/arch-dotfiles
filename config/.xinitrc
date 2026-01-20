#!/bin/sh
$HOME/dotfiles/scripts/status_bar &
dunst &
easyeffects --gapplication-service &
exec dwm
