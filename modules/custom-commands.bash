#!/bin/bash

echo "Setting up custom commmands"

LOCATION="$PWD/modules/bash/bashrc-source-me.bash"
BASH_CONFIG_PATH="$HOME/.config/bash"

if [ ! -d "$BASH_CONFIG_PATH" ]; then
    mkdir -p $BASH_CONFIG_PATH
fi

# Copy custom commands
cp $LOCATION $BASH_CONFIG_PATH
