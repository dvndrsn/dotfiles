if [ "$(uname)" == "Darwin" ]; then
    # Cask on OSX only
    brew cask install google-chrome
    brew cask install firefox
    brew cask install spotify
    brew cask install slack
    brew cask install screenhero
    brew cask install dropbox
    brew cask install keypassx
    brew cask install xld # audio transcoding

    brew cask install dash
    brew cask install iterm2
    brew cask install caffeine
    brew cask install spectacle
    brew cask install flux

    # not in brew
    # tomato one timer
    # ableton live 9
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sh setup/ubuntu/chrome.sh
    sudo apt-get install firefox
    sh setup/ubuntu/spotify.sh
    # slack - https://slack.com/downloads/instructions/linux
    sh setup/ubuntu/dropbox.sh
    sh setup/ubuntu/flux.sh
    # pomodoro - https://pomodoneapp.com/download-pomodone-app.html#linux
fi
