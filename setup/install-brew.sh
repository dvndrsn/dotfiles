# homebrew for Mac (Darwin) or Linux
if [ "$(uname)" == "Darwin" ]; then
    # install homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # install dependencies
    sudo apt-get install build-essential curl file git python-setuptools ruby --assume-yes
    # sudo apt-get install
    # install linuxbrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    PATH="$HOME/.linuxbrew/bin:$PATH"
    # post install
    PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    brew install gcc
fi
