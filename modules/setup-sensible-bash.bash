#!/bin/bash

echo "Setting up sensible bash"

LOCATION="$PWD/modules/bash/sensible.bash"
BASH_CONFIG_PATH="$HOME/.config/bash"

if [ ! -d "$BASH_CONFIG_PATH" ]; then
    mkdir -p $BASH_CONFIG_PATH
fi

# Copy sensible
cp $LOCATION $BASH_CONFIG_PATH
