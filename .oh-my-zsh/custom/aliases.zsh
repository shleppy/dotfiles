## This file contains personal aliases and functions.
## 
## Author: Shelby Hendrickx

# Alias vim, e to neovim
alias vim='nvim'
alias e='nvim'

# Create a new directory and set current dir to the new dir
alias mkcd='
    foo(){
        mkdir -p "$1";
        cd "$1";
    };
    foo '

# Clipboard (e.g. pipe command to clipboard with "echo 'hello world' | c")
alias c='xclip'
alias v='xclip -o'

# Open file for editing as super user, extra security over sudo vim
alias svim='sudoedit'

# Vimrc opens vimrc  
alias vimrc='nvim $HOME/.config/nvim/init.vim'

# Zshrc opens zshrc and sources
alias zshrc='nvim $HOME/.zshrc && source ~/.zshrc'

# System update
alias pacup='pamac upgrade -a'
alias aptup='sudo apt update && sudo apt upgrade'

# Start tmux with colors
alias tmux='tmux -2'

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

# List wifi-channels in order
alias wifi-channel='iwlist wlp59s0 scan | grep Frequency | sort | uniq -c | sort -n'

# Print colors
function color-test {
    printf "Colors:\n"
    for i in {0..255}; 
        do
            print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'};
        done
}
