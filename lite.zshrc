export PATH="$HOME/.local/bin:$PATH"

# --- oh-my-zsh ------------------------------------------------------------
# Brings the real completion system (compinit): case-insensitive matching,
# menu selection, and completions for git/flags/hosts. Guarded so the shell
# still starts if omz isn't installed yet.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""   # prompt is built from the LIGHTWEIGHT_* vars below
plugins=(git)

LIGHTWEIGHT_TIME_SHOW=true
LIGHTWEIGHT_USER_SHOW=always
LIGHTWEIGHT_DIR_SHOW=true
LIGHTWEIGHT_GIT_SHOW=true
LIGHTWEIGHT_CONDA_SHOW=true

LIGHTWEIGHT_PROMPT_ORDER=(
  time
  user
  dir
  git
  conda
  char
)

LIGHTWEIGHT_CHAR_SYMBOL="🚀 "
LIGHTWEIGHT_GIT_BRANCH_COLOR="yellow"
LIGHTWEIGHT_CONDA_COLOR="blue"

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# --- prompt builder -------------------------------------------------------
# Renders LIGHTWEIGHT_PROMPT_ORDER, one segment per entry, honouring the
# *_SHOW flags and colours above. Must run after the omz source, or the theme
# would overwrite PROMPT. No subshells: segments are prompt escapes that zsh
# expands at draw time.
autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '✗'
zstyle ':vcs_info:git:*' stagedstr '✚'
zstyle ':vcs_info:git:*' formats       "%F{$LIGHTWEIGHT_GIT_BRANCH_COLOR}%b%f %F{red}%u%c%f"
zstyle ':vcs_info:git:*' actionformats "%F{$LIGHTWEIGHT_GIT_BRANCH_COLOR}%b%f|%F{red}%a%f"

_lightweight_prompt() {
  vcs_info
  local seg
  local -a parts
  for seg in $LIGHTWEIGHT_PROMPT_ORDER; do
    case $seg in
      time)  [[ $LIGHTWEIGHT_TIME_SHOW  == true ]] && parts+=('%F{cyan}%*%f') ;;
      user)  [[ $LIGHTWEIGHT_USER_SHOW  == (true|always) ]] && parts+=('%F{magenta}%n%f') ;;
      dir)   [[ $LIGHTWEIGHT_DIR_SHOW   == true ]] && parts+=('%F{blue}%~%f') ;;
      git)   [[ $LIGHTWEIGHT_GIT_SHOW   == true && -n $vcs_info_msg_0_ ]] &&
               parts+=("${vcs_info_msg_0_%% #}") ;;
      conda) [[ $LIGHTWEIGHT_CONDA_SHOW == true && -n $CONDA_DEFAULT_ENV ]] &&
               parts+=("%F{$LIGHTWEIGHT_CONDA_COLOR}${CONDA_DEFAULT_ENV:t}%f") ;;
      char)  parts+=("$LIGHTWEIGHT_CHAR_SYMBOL") ;;
    esac
  done
  local line="${(j: :)parts}"
  PROMPT="${line% } "
}
add-zsh-hook precmd _lightweight_prompt

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
