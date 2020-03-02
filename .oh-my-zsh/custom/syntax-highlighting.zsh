# Fish like syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[path]=fg=cyan
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
