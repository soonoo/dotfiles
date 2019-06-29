#!/bin/sh
xrandr --output eDP-1 --primary --mode 2560x1440 --pos 0x1440 --rotate normal \
  --output HDMI-2 --mode 1920x1080 --pos 0x0 --scale 1.333x1.333 --rotate normal

# removes cursor flickering
# https://gitlab.freedesktop.org/xorg/xserver/issues/70
xrandr --output eDP-1 --scale 0.9999x0.9999
