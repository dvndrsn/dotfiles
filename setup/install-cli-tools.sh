#!/usr/bin/env bash

# essential
brew install git
git config --global user.name "Dave A."
git config --global user.email "dave@dvndrsn.com"
if [ "$(uname)" == "Darwin" ]
then
    git config --global credential.helper osxkeychain
fi

brew install ag
brew install autojump
brew install imagemagick
brew install bash-completion
brew install tree

# heroku / devops
brew install heroku-toolbelt
brew install awscli

# services
brew install postgres
brew install redis
# sudo apt-get install libcap-dev
# brew install mongodb
