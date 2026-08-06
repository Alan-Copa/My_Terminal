export PATH="$HOME/.local/bin:$PATH"

# --- oh-my-zsh ------------------------------------------------------------
# Brings the real completion system (compinit): case-insensitive matching,
# menu selection, and completions for git/flags/hosts. Guarded so the shell
# still starts if omz isn't installed yet.
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)

# spaceship prompt, falling back to a stock theme if it isn't installed
if [[ -f "$ZSH/custom/themes/spaceship.zsh-theme" ]]; then
  ZSH_THEME="spaceship"
else
  ZSH_THEME="robbyrussell"
fi

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

SPACESHIP_CHAR_SYMBOL="🚀 "
SPACESHIP_GIT_BRANCH_COLOR="yellow"
SPACESHIP_CONDA_COLOR="blue"

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# --- compact galaxy fetch -------------------------------------------------
sysinfo() {
  local C=$'\033[1;36m' M=$'\033[1;35m' G=$'\033[1;32m' X=$'\033[0m'
  print "${M}    .  *  .   ${C}$(whoami)${X}@${C}$(hostname -s)${X}"
  print "${M}  *  ✦   .  * ${X}────────────────────────"
  print "${M} .   ✦  *   . ${C}OS:     ${X}macOS $(sw_vers -productVersion) ($(uname -m))"
  print "${M}   *   .  ✦   ${C}Kernel: ${X}$(uname -r)"
  print "${M}  .  *   .  * ${C}Shell:  ${X}zsh $ZSH_VERSION"
  print "${M} ✦   .   *  . ${G}CPU:    ${X}$(sysctl -n machdep.cpu.brand_string)"
  print "${M}   .  *   .   ${G}RAM:    ${X}$(( $(sysctl -n hw.memsize) / 1073741824 )) GB"
  print "${M}  *   .  ✦  * ${G}Disk:   ${X}$(df -h / | awk 'NR==2 {print $4" free of "$2}')"
  print "${M} .   ✦   .  . ${G}Uptime: ${X}$(uptime | sed 's/.*up //; s/,[[:space:]]*[0-9]*[[:space:]]*users*.*//' | xargs)"
}

sysinfo
