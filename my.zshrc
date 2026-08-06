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

# --- MILKY WAY GALAXY FETCH (Radial/Spiral Coloring) ---

# 1. Calculate System Data
user_name=$(whoami)
host_name=$(hostname | cut -d. -f1)
os_ver="macOS $(sw_vers -productVersion)"
kernel_ver=$(uname -r)
uptime_info=$(uptime | awk -F'(up |,| users)' '{print $2}' | xargs)
shell_name=$(basename "$SHELL")
cpu_info=$(sysctl -n machdep.cpu.brand_string | sed 's/Apple //')
ram_info=$(sysctl -n hw.memsize | awk '{print $1/1024/1024/1024" GB"}')
disk_info=$(df -h / | awk 'NR==2 {print $2 " Total / " $4 " Free"}')

# 2. Define Colors
C_P="\033[1;35m"  # Purple (Outer)
C_B="\033[1;34m"  # Blue (Mid)
C_C="\033[1;36m"  # Cyan (Inner)
C_W="\033[1;37m"  # White (Core)
C_Y="\033[1;33m"  # Yellow (Core Center)
C_G="\033[1;32m"  # Green (Hardware)
C_M="\033[1;35m"  # Magenta (System)
C_T="\033[1;36m"  # Teal (Identity)
C_X="\033[0m"     # Reset
C_D="\033[1;30m"  # Dark Gray (Separator)

# 3. Print Galaxy (Radial Coloring)

# Line 1: Outer (Purple)
printf "${C_P}             __,aaPPPPPPPPaa,__${C_X}\n"

# Line 2: Outer (Purple)
printf "${C_P}         ,adP\"\"\"'          \`\"\"Yb,_${C_X}\n"

# Line 3: Outer (Purple) -> Mid (Blue)
printf "${C_P}      ,ad\"'                     \`\"Yb,${C_X}\n"

# Line 4: Outer (Purple) -> Mid (Blue) -> Outer (Purple)
printf "${C_P}    ,dP'     ${C_B}_,adPP\"\"\"\"\"YYba,_     ${C_P}\`\"Y,${C_X}\n"

# Line 5: Outer -> Mid -> Outer
printf "${C_P}   aP'     ${C_B},d\"\"'           \`\"\"Ya,     ${C_P}\"Y,${C_X}\n"

# Line 6: Outer -> Mid -> Inner (Cyan)
printf "${C_P} ,d\"     ${C_B},P\"     ${C_C}_________${C_B}     \`\"b,    ${C_P}\`Yb,    ${C_T}%s${C_X}\n" "CHAPO'S GALAXY"

# Line 7: Outer -> Mid -> Inner (Cyan)
printf "${C_P},d'     ${C_B}d\"    ${C_C},adP\"\"\"\"\"\"\"\"Yba,    ${C_B}\"b,    ${C_P}\"Y,   ${C_D}-------------------${C_X}\n"

# Line 8: Outer -> Mid -> Inner -> Mid -> Outer
printf "${C_P}d'    ${C_B},P'   ${C_C},dP\"            \`Yb,   ${C_B}\`Y,    ${C_P}\`Y,  ${C_T}User:   ${C_X}%s${C_X}\n" "$user_name"

# Line 9: Outer -> Mid -> Inner -> Core (Yellow) -> Inner -> Mid -> Outer
printf "${C_P}8    ${C_B},P'   ${C_C},d'    ${C_Y},dP\"\"Yb,    ${C_C}\`Y,   ${C_B}\`Y,    ${C_P}\`b  ${C_T}Host:   ${C_X}%s${C_X}\n" "$host_name"

# Line 10: Outer -> Mid -> Inner -> Core -> Inner -> Mid -> Outer
printf "${C_P}8    ${C_B}d'    ${C_C}d'   ${C_Y},d\"      \"b,   ${C_C}\`Y,   ${C_B}\`8,    ${C_P}Y, ${C_T}Shell:  ${C_X}%s${C_X}\n" "$shell_name"

# Line 11: Outer -> Mid -> Inner -> Core -> CENTER (White) -> Core -> Inner -> Mid -> Outer
printf "${C_P}8    ${C_B}8     ${C_C}8    ${C_Y}d'    ${C_W}_${C_Y}   \`Y,   ${C_C}\`8    ${C_B}\`8    ${C_P}\`b ${C_X}\n"

# Line 12: Outer -> Mid -> Inner -> Core -> CENTER -> Core -> Inner -> Mid -> Outer
printf "${C_P}8    ${C_B}8     ${C_C}8    ${C_Y}8     ${C_W}8${C_Y}    \`b    ${C_C}8     ${C_B}8     ${C_P}8 ${C_M}OS:     ${C_X}%s${C_X}\n" "$os_ver"

# Line 13: Outer -> Mid -> Inner -> Core -> Inner -> Mid -> Outer
printf "${C_P}8    ${C_B}Y,    ${C_C}Y,   ${C_Y}\`b, ,aP     P    ${C_C}8    ${C_B},P     ${C_P}8 ${C_M}Kernel: ${C_X}%s${C_X}\n" "$kernel_ver"

# Line 14: Outer -> Mid -> Inner -> Core -> Inner -> Mid -> Outer
printf "${C_P}I,   ${C_B}\`Y,   ${C_C}\`8,    ${C_Y}\"\"\"\"     ${C_C}d'   ,P    ${C_B}d\"    ${C_P},P ${C_M}Uptime: ${C_X}%s${C_X}\n" "$uptime_info"

# Line 15: Outer -> Mid -> Inner -> Mid -> Outer
printf "${C_P}\`b,   ${C_B}\`8,    ${C_C}\"b,         ,P\"   ${C_B},P'   ${C_P},P'    d' ${C_X}\n"

# Line 16: Outer -> Mid -> Inner -> Mid -> Outer
printf "${C_P} \`b,   ${C_B}\`Ya,    ${C_C}\"Ya,,__,aP\"    ${C_B},P'   ${C_P},P\"    ,P  ${C_G}CPU:    ${C_X}%s${C_X}\n" "$cpu_info"

# Line 17: Outer -> Mid -> Outer
printf "${C_P}  \`Y,    ${C_B}\`Ya,     ${C_B}\`\"\"\"''     ${C_P},P'   ,d\"    ,P'  ${C_G}RAM:    ${C_X}%s${C_X}\n" "$ram_info"

# Line 18: Outer -> Mid -> Outer
printf "${C_P}   \`Yb,    ${C_B}\`\"Ya,_         _,d\"    ${C_P},P'    ,P'   ${C_G}Disk:   ${C_X}%s${C_X}\n" "$disk_info"

# Line 19: All Outer (Purple)
printf "${C_P}     \`Yb,      \"\"YbaaaaadP\"'     ,P'    ,P'${C_X}\n"

# Lines 20-22: All Outer (Purple)
printf "${C_P}       \`Yba,                   ,d'    ,dP'${C_X}\n"
printf "${C_P}          \`\"Yba,__       __,adP\"     dP\"${C_X}\n"
printf "${C_P}              \`\"\"\"\"\"\"\"\"\"\"\"\"\"'${C_X}\n"

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

# --- Neutral colors for AI CLIs (claude, codex) ---
# The Homebrew profile paints normal text green and bold text red. TUIs that
# assume a neutral foreground (Claude Code, Codex) render badly under it.
# These wrappers recolor only the window running the CLI, then restore the
# profile's own colors when it exits. Every other shell keeps the galaxy look.

_term_window_colors() {
  # $1 = neutral | restore  (acts on the Terminal window owning this shell)
  [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] || return 0
  osascript - "$TTY" "$1" >/dev/null 2>&1 <<'OSA'
on run argv
  set theTTY to item 1 of argv
  set theMode to item 2 of argv
  tell application "Terminal"
    repeat with w in windows
      repeat with t in tabs of w
        try
          if tty of t is theTTY then
            if theMode is "neutral" then
              set normal text color of w to {55000, 55000, 55000}
              set bold text color of w to {65535, 65535, 65535}
              set cursor color of w to {48000, 48000, 48000}
              try
                set font antialiasing of w to true
              end try
            else
              set p to current settings of w
              set normal text color of w to normal text color of p
              set bold text color of w to bold text color of p
              set cursor color of w to cursor color of p
              try
                set font antialiasing of w to font antialiasing of p
              end try
            end if
            return
          end if
        end try
      end repeat
    end repeat
  end tell
end run
OSA
}

_with_neutral_colors() {
  local bin=$1; shift
  local rc=0
  _term_window_colors neutral
  {
    command "$bin" "$@" || rc=$?
  } always {
    _term_window_colors restore
  }
  return $rc
}

claude() { _with_neutral_colors claude "$@" }
codex()  { _with_neutral_colors codex "$@" }

# Manual escape hatch if a CLI is killed hard and the colors stay neutral.
alias term-colors-restore='_term_window_colors restore'
