# PS1
### Constants
# Reset
Color_Off="\033[0m"       # Text Reset

# Regular Colors
Black="\033[0;30m"        # Black
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Yellow="\033[0;33m"       # Yellow
Blue="\033[0;34m"         # Blue
Purple="\033[0;35m"       # Purple
Cyan="\033[0;36m"         # Cyan
White="\033[0;37m"        # White

# Bold
BBlack="\033[1;30m"       # Black
BRed="\033[1;31m"         # Red
BGreen="\033[1;32m"       # Green
BYellow="\033[1;33m"      # Yellow
BBlue="\033[1;34m"        # Blue
BPurple="\033[1;35m"      # Purple
BCyan="\033[1;36m"        # Cyan
BWhite="\033[1;37m"       # White

# Underline
UBlack="\033[4;30m"       # Black
URed="\033[4;31m"         # Red
UGreen="\033[4;32m"       # Green
UYellow="\033[4;33m"      # Yellow
UBlue="\033[4;34m"        # Blue
UPurple="\033[4;35m"      # Purple
UCyan="\033[4;36m"        # Cyan
UWhite="\033[4;37m"       # White

# Background
On_Black="\033[40m"       # Black
On_Red="\033[41m"         # Red
On_Green="\033[42m"       # Green
On_Yellow="\033[43m"      # Yellow
On_Blue="\033[44m"        # Blue
On_Purple="\033[45m"      # Purple
On_Cyan="\033[46m"        # Cyan
On_White="\033[47m"       # White

# High Intensty
IBlack="\033[0;90m"       # Black
IRed="\033[0;91m"         # Red
IGreen="\033[0;92m"       # Green
IYellow="\033[0;93m"      # Yellow
IBlue="\033[0;94m"        # Blue
IPurple="\033[0;95m"      # Purple
ICyan="\033[0;96m"        # Cyan
IWhite="\033[0;97m"       # White

# Bold High Intensty
BIBlack="\033[1;90m"      # Black
BIRed="\033[1;91m"        # Red
BIGreen="\033[1;92m"      # Green
BIYellow="\033[1;93m"     # Yellow
BIBlue="\033[1;94m"       # Blue
BIPurple="\033[1;95m"     # Purple
BICyan="\033[1;96m"       # Cyan
BIWhite="\033[1;97m"      # White

# High Intensty backgrounds
On_IBlack="\033[0;100m"   # Black
On_IRed="\033[0;101m"     # Red
On_IGreen="\033[0;102m"   # Green
On_IYellow="\033[0;103m"  # Yellow
On_IBlue="\033[0;104m"    # Blue
On_IPurple="\033[10;95m"  # Purple
On_ICyan="\033[0;106m"    # Cyan
On_IWhite="\033[0;107m"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\W"
PathFull="\w  "
NewLine="\n"
Jobs="\j"
User="\u"
Host="\h"
End="$" # ⚡︎

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

git_branch() {
    # -- Finds and outputs the current branch name by parsing the list of
    #    all branches
    # -- Current branch is identified by an asterisk at the beginning
    # -- If not in a Git repository, error message goes to /dev/null and
    #    no output is produced
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

staged_changes="+"
unstaged_changes="!"
untracked_changes="?"
stashed_changes="S"
unpushed_changes="P"

git_status() {
    # Returns a string with characters representing the state of the
    # current git branch
    local status="$(git status --porcelain 2>/dev/null)"
    local output=''
    [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && \
      output="${output}${staged_changes}"
    [[ -n $(egrep '^.[MD]' <<<"$status") ]] && \
      output="${output}${unstaged_changes}"
    [[ -n $(egrep '^\?\?' <<<"$status") ]] && \
      output="${output}${untracked_changes}"
    [[ -n $(git stash list) ]] && \
      output="${output}${stashed_changes}"
    [[ -n $(git log --branches --not --remotes) ]] && \
      output="${output}${unpushed_changes}"
    echo $output
}

git_color() {
    # Receives output of git_status as argument; produces appropriate color
    # code based on status of working directory
    local staged_changes=$([[ $1 =~ \+ ]] && echo yes)
    local uncommitted_changes=$([[ $1 =~ [!\?] ]] && echo yes)
    if [[ -n $staged_changes ]] && [[ -n $uncommitted_changes ]]; then
        echo -e $IYellow
    elif [[ -n $staged_changes ]]; then
        echo -e $IGreen
    elif [[ -n $uncommitted_changes ]]; then
        echo -e $IRed
    else
        echo -e $IWhite
    fi
}

display_status() {
    local branch_separator="|"
    [[ -n $1 ]] && echo "${branch_separator}${1}"
}

COLOR_START="\x01"
COLOR_END="\x02"

display_color() {
    echo -e "${COLOR_START}$1${COLOR_END}"
}

git_prompt() {
    local current_branch=$(git_branch)
    if [[ -n $current_branch ]]; then
        local branch_state=$(display_status $(git_status))
        local color=$(display_color $(git_color $branch_state))
        echo -e "$color[$current_branch]"
    fi
}

PS1="$User@$Host:$PathFull \$(git_prompt)$Color_Off\n"
PS1+="  $End  "

export PS1
