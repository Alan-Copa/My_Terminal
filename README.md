# My_Terminal

My personalized zsh setups :)

## The two shells

Both source oh-my-zsh, so both get the same completion: case-insensitive TAB,
menu selection, git/flag completion, and the `ll`/`la`/`l` aliases.

### `lite.zshrc` — current, NDT mac

| | |
|---|---|
| prompt | `robbyrussell` — `➜  dir git:(main) ✗` |
| plugins | `git` |
| fetch | 10-line compact galaxy |
| PATH | `~/.local/bin` only |

Self-contained. The omz source is guarded, so the shell still starts on a
machine without it — you just lose the good completion.

### `my.zshrc` — old mac

| | |
|---|---|
| prompt | `spaceship` — rocket char, time / user / dir / git / conda |
| plugins | `git` |
| fetch | 22-line full ASCII galaxy, radial coloring |
| PATH | texlive, openjdk 21, pip, ruby, pixi, nvm, conda, antigravity |

Also wraps `claude` and `codex` to swap the Terminal window to neutral colors
while they run, because the green-on-red profile wrecks their TUIs.

Needs a separate spaceship install; `lite.zshrc` does not.

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
