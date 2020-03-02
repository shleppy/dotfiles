## This file contains personal aliases.
## 
## Author: Shelby Hendrickx

# Create a new directory and set current dir to the new dir
alias mkcd='
    foo(){
        mkdir -p "$1";
        cd "$1";
    };
    foo '

# Open file for editing as superuser
alias svim='sudo vim '

# Update system
alias update='sudo apt update && sudo apt upgrade'

# Extract tar files
alias untar='tar -zxvf '

# Default ping to 5 pings
alias ping='ping -c 5'

# Change directory after using ginit
alias ginit='
    foo(){
        ginit "$1";
        cd $1;
    };
    foo '

# Custom git command for dotfiles 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
