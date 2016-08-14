# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ll='ls -lrthA --group-directories-first'
# Lines added by the Vim-R-plugin command :RpluginConfig (2014-Feb-16 18:43):
# Change the TERM environment variable (to get 256 colors) and make Vim
# connecting to X Server even if running in a terminal emulator (to get
# dynamic update of syntax highlight and Object Browser):

# 2014-10-05 the following bash code is not working, I want this because my GUIless vim 
# is not built with the +server option
if [ "x$DISPLAY" != "x" ]
then
	if [ "screen" = "$TERM" ]
	then
		export TERM=screen-256color
	else
		export TERM=xterm-256color
	fi
	alias vim='vim --servername VIM'
fi
#	alias vim="vim --servername VIM"
#	if [ "$TERM" == "xterm" ] || [ "$TERM" == "xterm-256color" ]
#	then
#		function tvim(){ tmux -2 new-session "TERM=screen-256color vim --servername VIM $@" ; }
#	else
#		function tvim(){ tmux new-session "vim --servername VIM $@" ; }
#	fi
#else
#	if [ "$TERM" == "xterm" ] || [ "$TERM" == "xterm-256color" ]
#	then
#		export HAS_256_COLORS=yes
#		alias tmux="tmux -2"
#		function tvim(){ tmux -2 new-session "TERM=screen-256color vim $@" ; }
#	else
#		function tvim(){ tmux new-session "vim $@" ; }
#	fi
#fi
#if [ "$TERM" = "screen" ] && [ "$HAS_256_COLORS" = "yes" ]
#then
#	export TERM=screen-256color
#fi
PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-linux:$HOME/Build/vim/bin:$HOME/Build/openblas:$HOME/Build/R/bin

#2015-05-02 For citrix client on linux
export ICAROOT=/home/statquant/Build/citrix

#2016-07-11 powerline for shell
command -v powerline-daemon &>/dev/null
if [ $? -eq 0 ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	. /usr/share/powerline/bash/powerline.sh
fi

#2016-07-23 building terminator
#2016-07-31 installed from rpm
#export INTLTOOL_BIN=$HOME/Build/intltool/bin
#PATH=$PATH:$INTLTOOL_BIN
#export PYTHONPATH=$PYTHONPATH:/home/statquant/Build/terminator/lib/python2.7/site-packages/
#export TERMINATOR_BIN=$HOME/Build/terminator/bin
#PATH=$PATH:$TERMINATOR_BIN

#2016-07-27 adding q
export QHOME=~/Build/q/
export PATH=$PATH:$QHOME/l32
alias q='~/Script/q.sh'

#2016-07-31 adding rlwrap
export RLWRAP_BIN=$HOME/Build/rlwrap/bin
PATH=$PATH:$RLWRAP_BIN
