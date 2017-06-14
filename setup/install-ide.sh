# ViM
install_vim() {
    brew install vim
    # git clone https://github.com/pivotal/vim-config.git ~/.vim
    ~/.vim/bin/install
}

# Spacemacs
install_spacemacs() {
    if [ "$(uname)" == "Darwin" ]; then
        # fonts
        brew tap caskroom/fonts
        brew cask install font-source-code-pro

        # emacs
        brew tap d12frosted/emacs-plus
        brew install emacs-plus
        brew linkapps emacs-plus
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        # using submodule https://github.com/favadi/build-emacs
        sh setup/ubuntu/emacs/build-emacs.sh
    fi
    # git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    emacs --insecure &
}

install_sublime() {
    if [ "$(uname)" == "Darwin" ]; then
        brew cask install sublime-text
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        sudo add-apt-repository ppa:webupd8team/sublime-text-3
        sudo apt-get update
        sudo apt-get install sublime-text-installer
    fi
}

install_vim
install_spacemacs
install_sublime
