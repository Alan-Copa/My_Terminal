export PATH=/Library/TeX/texbin:$PATH

# JAVA PATH
export JAVA_HOME="/opt/homebrew/opt/openjdk@21"
export PATH="$JAVA_HOME/bin:$PATH"


# Python pip PATH
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Pixi Autocompletion for Robotics
# eval "$(pixi completion --shell zsh)"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# --- MILKY WAY FETCH ---
# 1. Calculate Data Variables
user_name=$(whoami)
host_name=$(hostname | cut -d. -f1)
os_ver="macOS $(sw_vers -productVersion)"
kernel_ver=$(uname -r)
uptime_info=$(uptime | awk -F'(up |,| users)' '{print $2}' | xargs)
shell_name=$(basename "$SHELL")
cpu_info=$(sysctl -n machdep.cpu.brand_string | sed 's/Apple //')
ram_info=$(sysctl -n hw.memsize | awk '{print $1/1024/1024/1024" GB"}')

# Disk: Shows "Total / Available"
# NR==2 selects the second line of df output. $2 is Total, $4 is Available.
disk_info=$(df -h / | awk 'NR==2 {print $2 " Total / " $4 " Free"}')

# 2. Define Colors
C_PURPLE="\033[1;35m"
C_CYAN="\033[1;36m"
C_BLUE="\033[1;34m"
C_GREEN="\033[1;32m"
C_RESET="\033[0m"
C_GRAY="\033[1;30m"

# 3. Print - Galaxy Shape + Grouped Info
printf "${C_PURPLE}      . : .       ${C_CYAN}%s${C_RESET}\n"         "MILKY WAY STATION"
printf "${C_PURPLE}    '.  _  .'     ${C_GRAY}-------------------${C_RESET}\n"
printf "${C_PURPLE}   -=  ( )  =-    ${C_CYAN}User:   ${C_RESET}%s${C_RESET}\n" "$user_name"
printf "${C_PURPLE}    .'  ~  '.     ${C_CYAN}Host:   ${C_RESET}%s${C_RESET}\n" "$host_name"
printf "${C_PURPLE}      ' : '       ${C_CYAN}Shell:  ${C_RESET}%s${C_RESET}\n" "$shell_name"
printf "${C_PURPLE}       . '        ${C_RESET}\n"
printf "${C_PURPLE}      .           ${C_PURPLE}OS:     ${C_RESET}%s${C_RESET}\n" "$os_ver"
printf "${C_PURPLE}     .            ${C_PURPLE}Kernel: ${C_RESET}%s${C_RESET}\n" "$kernel_ver"
printf "${C_PURPLE}    .             ${C_PURPLE}Uptime: ${C_RESET}%s${C_RESET}\n" "$uptime_info"
printf "${C_PURPLE}   .              ${C_RESET}\n"
printf "${C_PURPLE}    '             ${C_GREEN}CPU:    ${C_RESET}%s${C_RESET}\n" "$cpu_info"
printf "${C_PURPLE}     '            ${C_GREEN}RAM:    ${C_RESET}%s${C_RESET}\n" "$ram_info"
printf "${C_PURPLE}      '           ${C_GREEN}Disk:   ${C_RESET}%s${C_RESET}\n" "$disk_info"
printf "\n"

# Spaceship configuration
SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=always
SPACESHIP_DIR_SHOW=true
SPACESHIP_GIT_SHOW=true
SPACESHIP_CONDA_SHOW=true

SPACESHIP_PROMPT_ORDER=(
  time
  user
  dir
  git
  conda
  char
)

# Make the prompt character a rocket!
SPACESHIP_CHAR_SYMBOL="🚀 "

# Customize colors (optional)
SPACESHIP_GIT_BRANCH_COLOR="yellow"
SPACESHIP_CONDA_COLOR="blue"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
export PATH="/Users/alancopa/.pixi/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Added by Antigravity
export PATH="/Users/alancopa/.antigravity/antigravity/bin:$PATH"

. "$HOME/.local/bin/env"
