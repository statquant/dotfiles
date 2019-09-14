if [ -f "$HOME/.bash_aliases" ] ; then
  source $HOME/.bash_aliases
fi

# native
if [ -f "$HOME/.fzf.bash" ] ; then 
  source ~/.fzf.bash
fi

# 20190825
# https://fedoramagazine.org/add-power-terminal-powerline/
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bash/powerline.sh
fi

# add nvim
export PATH=${HOME}/.local/share/nvim/:${PATH}
# add q
export PATH=${HOME}/q/bin/:${PATH}
# add user python
export PATH=${HOME}/.local/bin/:${PATH}
# add Scripts directory
export PATH=${HOME}/Scripts/:${PATH}
