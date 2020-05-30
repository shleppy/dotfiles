### My zshrc
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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Current theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Make sure plugins are loaded before oh-my-zsh
if [[ -a ~/.oh-my-zsh/custom/plugins-init.zsh ]]; then
  source ~/.oh-my-zsh/custom/plugins-init.zsh
fi

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Custom configuration

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

