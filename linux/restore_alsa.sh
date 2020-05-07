#!/bin/bash

# for this to work, set the alsamixer settings however you like, then execute this command to save the settings:
#
#    alsactl --file ~/.config/asound.state store

alsactl --file ~/.config/asound.state restore

# alternative: use amixer to set a control value, using aplay -l with grep to target a device
#
#amixer -c `aplay -l | grep USB2.0 | head -1 | cut -b 5-6` set PCM 80%
