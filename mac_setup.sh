#!/usr/bin/env bash

# homebrew for Mac (Darwin) or Linux
if [ "$(uname)" == "Darwin" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  PATH="$HOME/.linuxbrew/bin:$PATH"
end

# essential
brew install git
# git config --global user.name "Dave A."
# git config --global user.email "dave@dvndrsn.com"
# git config --global credential.helper osxkeychain

brew install ag
brew install autojump
brew install imagemagick
brew install bash-completion

brew cask install google-chrome
brew cask install firefox
brew cask install spotify
brew cask install slack
brew cask install screenhero
brew cask install dropbox
brew cask install keypassx
brew cask install xld

brew cask install dash
brew cask install iterm2
brew cask install caffeine
brew cask install spectacle
brew cask install flux

# fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro

# IDE
brew install vim
# git clone https://github.com/pivotal/vim-config.git ~/.vim

brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

brew install sublime-text

# heroku / devops
brew install heroku-toolbelt
brew install awscli

# ruby
brew install rbenv
brew install ruby-build

# python
brew install pyenv
brew install pyenv-virtualenvwrapper

# node
brew install nvm

# services
brew install postgres
brew install redis
brew install mongodb

# not in brew
# tomato one timer
# ableton live 9

# install dotfiles
./install


# editor final setup / package installation
~/.vim/bin/install
emacs --insecure &
