#!/bin/bash
# Driven code
chmod +x ./packages/install_packages.sh

bash ./packages/install_packages.sh
ln -vsf "`pwd`/.bashrc" $HOME/
