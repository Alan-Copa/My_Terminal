# My_Terminal

My personalized zsh setups :)

## The two shells

Both source oh-my-zsh, so both get the same completion: case-insensitive TAB,
menu selection, git/flag completion, and the `ll`/`la`/`l` aliases.

### `lite.zshrc` — current, NDT mac

| | |
|---|---|
| prompt | own builder — time / user / dir / git / conda / 🚀 |
| plugins | `git` |
| fetch | 10-line compact galaxy |
| PATH | `~/.local/bin` only |

```
16:28:50 developer ~/Desktop/My_Terminal  main ✗ 🚀
```

No theme (`ZSH_THEME=""`). The prompt is configured by the `LIGHTWEIGHT_*`
vars at the top and rendered by `_lightweight_prompt` at the bottom, on a
`precmd` hook. Same knobs spaceship gave, no third-party install, no
subprocess per prompt — segments are prompt escapes plus zsh's own `vcs_info`.

Edit `LIGHTWEIGHT_PROMPT_ORDER` and the prompt changes on the next line; the
array is re-read every time. Segments hide themselves when empty:

| change | result |
|---|---|
| `LIGHTWEIGHT_PROMPT_ORDER=(dir git char)` | `~/Desktop/My_Terminal  main ✗ 🚀` |
| `LIGHTWEIGHT_GIT_SHOW=false` | `16:28:51 developer ~/Desktop/My_Terminal 🚀` |
| outside a git repo | `16:28:51 developer /tmp 🚀` |
| conda env active | `… main ✗ robotics 🚀` |

Adding a segment = one `case` branch in the builder. `check-for-changes true`
draws the `✗`/`✚` markers and is the only costly line — turn it off if a huge
repo makes the prompt lag.

The omz source is guarded, so the shell still starts on a machine without it —
you just lose the good completion.

### `my.zshrc` — old mac

| | |
|---|---|
| prompt | `spaceship` — rocket char, time / user / dir / git / conda |
| plugins | `git` |
| fetch | 22-line full ASCII galaxy, radial coloring |
| PATH | texlive, openjdk 21, pip, ruby, pixi, nvm, conda, antigravity |

Needs a separate spaceship install; `lite.zshrc` does not. Also wraps `claude`
and `codex` to swap the Terminal window to neutral colors while they run,
because the green-on-red profile wrecks their TUIs.

## Install

No Homebrew needed — omz only wants `git` and `curl`, both already on macOS
via the Xcode Command Line Tools.

```
cp ~/.zshrc ~/.zshrc.backup-$(date +%Y%m%d-%H%M%S)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
cp lite.zshrc ~/.zshrc
source ~/.zshrc
```

`--keep-zshrc` stops the installer overwriting `~/.zshrc` with its own
template. `lite.zshrc` is the whole file — don't append it to the template or
omz loads twice. Keep the `sysinfo` call last, after `source $ZSH/oh-my-zsh.sh`.

`sysinfo` re-prints the galaxy any time.
