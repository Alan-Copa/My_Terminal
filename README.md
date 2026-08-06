# My_Terminal

My personalized zsh setups :)

| file | what it is |
|---|---|
| `lite.zshrc` | **Current.** 17 lines: PATH + compact galaxy fetch. |
| `my.zshrc` | Old machine. oh-my-zsh + spaceship, full ASCII galaxy. |

## Install

The oh-my-zsh installer **overwrites `~/.zshrc`** (it moves the old one to
`~/.zshrc.pre-oh-my-zsh`). So install brew and omz first, then append:

```
cat lite.zshrc >> ~/.zshrc
source ~/.zshrc
```

Keep the galaxy call at the very end of the file, after
`source $ZSH/oh-my-zsh.sh`.

`ll`, `la`, `l` come from oh-my-zsh's `lib/directories.zsh` — no aliases needed here.
`sysinfo` re-prints the galaxy any time.
