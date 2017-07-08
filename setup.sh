#!/usr/bin/env bash

# install dotfiles
./install

sh setup/install-brew.sh

sh setup/install-cli-tools.sh

sh setup/install-apps.sh

sh setup/install-ide.sh

sh setup/install-lang.sh
