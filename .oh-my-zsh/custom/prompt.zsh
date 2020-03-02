SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
#  node          # Node.js section
  ruby          # Ruby section
  golang        # Go section
  php           # PHP section
  haskell       # Haskell Stack section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  pyenv         # Pyenv section
  kubectl       # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  time          # Time stamps section
  battery       # Battery level and status
)

# Show battery when below threshold or fully charged
SPACESHIP_BATTERY_COLOR=cyan
SPACESHIP_BATTERY_SHOW=true
SPACESHIP_BATTERY_SYMBOL_FULL=' ' 
SPACESHIP_BATTERY_THRESHOLD=20

# Color of prompt char
SPACESHIP_CHAR_COLOR_SUCCESS=white

# Dir
SPACESHIP_DIR_PREFIX=" "

# Git
SPACESHIP_GIT_STATUS_COLOR=red
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""

# PHP
SPACESHIP_PHP_SYMBOL=' ' 

# Time
SPACESHIP_TIME_SHOW=false
# SPACESHIP_TIME_COLOR=cyan
# SPACESHIP_TIME_PREFIX=""

# Show at
#SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false

