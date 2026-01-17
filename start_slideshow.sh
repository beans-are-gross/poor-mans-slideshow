#!/bin/bash

loopDir="<your folder>"   # Edit this line only.

sleep 5                   # Wait for the desktop to be ready.

xset s off                # Disable screen saver timer
xset -dpms                # Disable Power Management (the 10-minute shutdown)
xset s noblank            # Prevent the screen from going black

# Deletes Mac metadata, Windows thumbnails, and Linux thumbnails
find "$loopDir" \( -name "._*" -o -name "thumbs.db" -o -name "desktop.ini" \) -delete

while true; do            # Loop forever just incase a file in the loop isnt an image file.
  feh -F -Z -Y -z -D 10 --auto-rotate --reload 60 --quiet --recursive $loopDir

  if [ $? -eq 0 ]; then   # Check if the esc key was pressed and end the loop.
    break
  fi
done
