## My zshrc
#          _     
#  _______| |__  
# |_  / __| '_ \ 
#  / /\__ \ | | |
# /___|___/_| |_|
#
## Author: Shelby Hendrickx

# Custom zsh files locations
# ZSH_CUSTOM="/$HOME/.oh-my-zsh/custom"
# /$ZSH_CUSTOM/plugins      -- plugins
# /$ZSH_CUSTOM/themes       -- themes
# /$ZSH_CUSTOM/aliases.zsh  -- aliases
# etc..

# Path to my oh-my-zsh installation.
export ZSH="/$HOME/.oh-my-zsh"

# Current zsh theme
ZSH_THEME="materialshell"

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Make sure plugins are loaded before oh-my-zsh
if [[ -a ~/.oh-my-zsh/custom/plugins-cfg.zsh ]]; then
  source ~/.oh-my-zsh/custom/plugins-cfg.zsh
fi

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
