#!/bin/bash
# OneDrive configuration
# OneDrive source code at https://github.com/abraunegg/onedrive

if hash onedrive 2>/dev/null; then
  ONEDRIVE="onedrive"
else
  echo "Onedrive was not installed."
  exit 1
fi

# Checking if the log folder exists
if [ ! -d /var/log/onedrive ]; then
  sudo mkdir /var/log/onedrive
fi

# Permissions
# sudo chown $USER /var/log/onedrive/

# First run
# $ONEDRIVE

# Starting onedrive service
# systemctl --user enable $ONEDRIVE
# systemctl --user start $ONEDRIVE
