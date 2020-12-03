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
# installed neovim through dnf
# export PATH=${HOME}/.local/share/nvim/:${PATH}

# add user python
export PATH=${HOME}/.local/bin/:${PATH}

# add Scripts directory
export PATH=${HOME}/Scripts/:${PATH}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# conda can be deactivated using conda deactivate
# conda can be reactivated using conda activate
__conda_setup="$('/home/statquant/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/statquant/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/statquant/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/statquant/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# add q
# 20200522 I installed q via conda when installing jupyterq and it seems that QHOME is automagically set to /home/statquant/miniconda3/q
#export MINICONDA_HOME=/home/statquant/miniconda3/
#export QBIN=
#export QHOME=
#export PATH=${QHOME}:${QBIN}:${PATH}
