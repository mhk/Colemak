#!/bin/bash
# reset:
# apt-get install --reinstall xkb-data

# backup
cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/$(date +%F).us
cp symbols/us.ckp-kin /usr/share/X11/xkb/symbols
cp symbols/us.ckp-kin /usr/share/X11/xkb/symbols/us
rsync -avH /usr/share/X11/xkb/rules /usr/share/X11/xkb/$(date +%F).rules

patch /usr/share/X11/xkb/rules/evdev.xml rules/evdev.xml.diff
patch /usr/share/X11/xkb/rules/base.xml  rules/base.xml.diff
patch /usr/share/X11/xkb/rules/evdev.lst rules/evdev.lst.diff
patch /usr/share/X11/xkb/rules/base.lst  rules/base.lst.diff
