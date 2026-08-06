export PATH="$HOME/.local/bin:$PATH"

# --- oh-my-zsh ------------------------------------------------------------
# Brings the real completion system (compinit): case-insensitive matching,
# menu selection, and completions for git/flags/hosts. Guarded so the shell
# still starts if omz isn't installed yet.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
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
