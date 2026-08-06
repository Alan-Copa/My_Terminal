# My_Terminal

My personalized zsh setups :)

| file | what it is |
|---|---|
| `lite.zshrc` | **Current.** PATH + oh-my-zsh (robbyrussell) + compact galaxy fetch. |
| `my.zshrc` | Old machine. oh-my-zsh + spaceship, full ASCII galaxy. |

## Install

No Homebrew needed — omz only wants `git` and `curl`, both of which ship with
the Xcode Command Line Tools that macOS already has.

`lite.zshrc` sources omz itself, so it is the whole `~/.zshrc` — don't append
it to the installer's template or omz gets sourced twice. `--keep-zshrc` stops
the installer from writing that template at all (without it, it overwrites
`~/.zshrc` and moves yours to `~/.zshrc.pre-oh-my-zsh`).

```
cp ~/.zshrc ~/.zshrc.backup-$(date +%Y%m%d-%H%M%S)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
cp lite.zshrc ~/.zshrc
source ~/.zshrc
```

`--unattended` skips the `chsh` prompt and the "run zsh now" hand-off. Drop it
if the login shell isn't already zsh (`echo $SHELL`).

Keep the `sysinfo` call at the very end of the file, after
`source $ZSH/oh-my-zsh.sh`.

## Why omz and not 17 lines

Bare zsh never runs `compinit`, so TAB stays on the primitive builtin
`expand-or-complete`: exact-case path completion, no menu, nothing for git or
flags. Sourcing omz runs `compinit`, which rebinds the same key to a
completion widget backed by `_main_complete`, and sets case-insensitive +
partial-word matching, `menu select`, `completeinword`, `alwaystoend`:

```
zle -C expand-or-complete .expand-or-complete _main_complete
matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
```

The `[[ -f ... ]]` guard means the shell still starts where omz isn't
installed — you just fall back to the primitive completion.

Not in this file, but live once omz loads: ~230 aliases and assorted setopts
from `lib/*.zsh` + the git plugin, anything in `~/.oh-my-zsh/custom/*.zsh`,
the `~/.zcompdump` cache, and omz's own auto-update (prompts to `git pull`
every 13 days — pin it with `zstyle ':omz:update' mode disabled`).

`ll`, `la`, `l` come from oh-my-zsh's `lib/directories.zsh` — no aliases needed here.
`sysinfo` re-prints the galaxy any time.
