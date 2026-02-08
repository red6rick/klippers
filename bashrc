# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set options for less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

######################################################################
# bash options and features

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias rebash='source ~/.bash_profile && echo " ok" || echo " ?"'

EDITOR=/usr/bin/nano
export EDITOR

alias git-repo='git remote show origin'
alias git-url='git remote show origin'
alias clone='git clone'
alias commit='git commit'
alias push='git push'

alias ll='ls -la'
alias dirs='ls -l | grep ^d | cut -w -f 9- | sed -e "s/\t/ /g"'
alias links='ls -la | grep ^l | cut -w -f 9- | sed -e "s/\t/ /g"'

alias cd..='cd ../'        # Go back 1 directory level (for fast typers)
alias ..='cd ../'          # Go back 1 directory level
alias ...='cd ../../'      # Go back 2 directory levels
alias ....='cd ../../../'  # Go back 3 directory levels

######################################################################
# functions

nd () { mkdir -p "$1" && cd "$1"; }         # Makes new Dir and jumps inside

