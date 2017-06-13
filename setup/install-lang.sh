install_ruby() {
    brew install rbenv
    brew install ruby-build
    # install latest
    rbenv install $(rbenv install -l | \
                        sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*$/ h;${g;p;}')
    # use latest ruby
    rbenv global $(rbenv versions --bare | \
                        sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*$/ h;${g;p;}')
}

install_python() {
    if [ "$(uname)" == "Darwin" ]; then
        brew install readline xz
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
            libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
            xz-utils tk-dev
    fi

    brew install pyenv
    brew install pyenv-virtualenvwrapper
    # install latest
    git clone https://github.com/momo-lab/pyenv-install-latest.git "$(pyenv root)"/plugins/pyenv-install-latest
    pyenv install-latest 2.7
    pyenv install-latest
    # use latest
    pyenv global $(pyenv versions --bare | \
                        sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*$/ h;${g;p;}')
}

install_node() {
    brew install nvm

    # install and use most recent long term service node
    nvm install --lts
    nvm use --lts
}

install_ruby
install_python
install_node
