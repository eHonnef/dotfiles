#----------------------------------------------------------------------------#
# This will be appended to .bashrc
#----------------------------------------------------------------------------#

# Sensible bash
if [ -f ~/.config/bash/sensible.bash ]; then
	source ~/.config/bash/sensible.bash
fi

# If you are in a git repository, append the current branch to the terminal
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[00m\][\w]\[\e[91m\]\$(parse_git_branch)\[\e[00m\]> "

# Aliases
alias timestamp='date +"[%Y-%m-%d %H:%M:%S]"'
alias py='python3'
alias sizeof='du -hc --max-depth=0'
alias lsalias='echo "From .bashrc: timestamp || py || sizeof"'

# editor
export EDITOR=vim

# to execute a command without output and as background process
# usage: noout COMMAND
function noout() {
    nohup "$@" &> /dev/null &
}
