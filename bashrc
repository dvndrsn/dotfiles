# Settings
source ~/.bash/tools.sh

# Aliases
source ~/.bash/aliases.sh

# Custom prompt
source ~/.bash/prompt.sh

# local configuration
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
