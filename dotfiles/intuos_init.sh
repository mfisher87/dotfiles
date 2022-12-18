#!/bin/bash
#
# Initialize the Intuos 4 6x9 tablet. This must be done after connecting the
# tablet as a login user. Configures the button bindings and the OLED screens
#
# Execute with the "configure" positional argument to compile the OLED screen
# configuration.


##############################
# Buttons
#
# Assuming the tablet is oriented in "right-handed" mode, i.e. the buttons are
# on the left side. For some reason, the button numbers were not as documented.

# Top set of buttons:
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 2 "key +ctrl z -ctrl"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 3 "key +ctrl r -ctrl"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 8 "key +ctrl s -ctrl"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 9 "key del"


# Wheel center button
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 1 1


# Bottom set of buttons:
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 10 "key 7"  # Excalidraw pen
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 11 "key 1"  # Excalidraw cursor
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 12 "key shift"
xsetwacom set "Wacom Intuos4 6x9 Pad pad" Button 13 "key control"

echo "Drawing tablet key bindings configured!"


##############################
# OLED Screens
#

if [ ! `which intuos4oled.py` ]; then
    echo "WARNING: OLEDs can't be configured. Install https://github.com/mfisher87/intuos4-oled.git first."
    echo "See \`install-oled-tool.sh\` helper script."
    exit 0
fi

if [ "$1" = "configure" ]; then
    # NOTE: Buttons are numbered sequentially from top-to-bottom unlike with the
    # `libwacom` API.
    # EXAMPLE: Set button 0 text with font filename from `fc-list` command:
    #    intuos4oled.py set -t "Text here" -b 0 --font "Ubuntu-C.ttf"
    # EXAMPLE: Set button 1 icon with tux.png (can be found in source repo for
    # `intuos4oled.py`):
    #    intuos4oled.py set -i images/tux.png -b 1

    # Top 4 screens
    intuos4oled.py set -t "Undo" -b 0
    intuos4oled.py set -t "Redo" -b 1
    intuos4oled.py set -t "Save" -b 2
    intuos4oled.py set -t "Delete" -b 3

    # Bottom 4 screens
    intuos4oled.py set -t "Pen" -b 4
    intuos4oled.py set -t "Cursor" -b 5
    intuos4oled.py set -t "Shift" -b 6
    intuos4oled.py set -t "Ctrl" -b 7

    echo "OLED display configuration compiled!"
fi

intuos4oled.py update

echo "Drawing tablet OLED screens updated!"
