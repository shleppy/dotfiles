# Shleppy's Dotfiles
This repo contains my dotfiles if you couldn't tell from the title.

## installation on new system

Create a fork and do the following:

* Add the following alias to your .bashrc or .zshrc
> Note: you could rename the alias however you please (e.g. dotfiles)
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME
```

* Add .cfg to your .gitignore 
```bash
echo ".cfg" >> $HOME/.gitignore
```

* Clone this repo as a bare repo
> Note: you might need to change the url if you use http

```bash
# if you use ssh ue the following:
git clone --bare git@github.com:shleppy/dotfiles.git $HOME/.cfg
# if you use https use the following:
git clone --bare https://github.com/shleppy/dotfiles.git $HOME/.cfg
```

* Checkout the content from the bare repo
> Note that this might cause conflicts, choose to either remove the conflicting files or back them up
```bash
config checkout
```

* Ignore untracked files when using git on this repo
```bash
config config --local status.showUntrackedFiles no
```

## Usage 
```bash
config status
config add .myrc
config commit -m "Add myrc"
config push
```


