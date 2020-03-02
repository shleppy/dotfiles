## My zshrc
## Author: Shelby Hendrickx

# Custom zsh files locations
# ZSH_CUSTOM="/$HOME/.oh-my-zsh/custom"
# /$ZSH_CUSTOM/plugins      -- plugins
# /$ZSH_CUSTOM/themes       -- themes
# /$ZSH_CUSTOM/aliases.zsh  -- aliases

# Set Path
export PATH="/$HOME/.config/composer/vendor/bin:/$HOME/scripts:/$HOME/bin:/$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

# Path to my oh-my-zsh installation.
export ZSH="/$HOME/.oh-my-zsh"

# Current zsh theme
ZSH_THEME="spaceship"

# Plugins
plugins=(
	colored-man-pages
	git
	zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

