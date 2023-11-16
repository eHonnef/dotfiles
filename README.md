# Checklist of what to do after installing Fedora:

- Run `sudo dnf update`
- Run the `setup.sh`
- Install NVIDIA proprietary drivers
- ~~Import vscodium profile~~
- Add the secondary drive to be mounted on init
- If there is something else, be good for your future self and add to the `setup.sh` or to this readme

## Install stuff

- Jetbrains font
- Sublime
- CLion

## Import KDE stuff

Install [konsave](https://github.com/Prayag2/konsave) with pip.

Follow the instructions there for the `knsv` file.

## Using modules

You can run a module by itself, so, for example, if you updated the "bashrc-source-me.bash", then you can just run the "custom-commands.bash".

Also, execute stuff from the root directory.

## Important regards

The script setup.sh is meant to be executed only once, executing more times can lead to problems.

## TODO

- Modularize the setup.sh script
