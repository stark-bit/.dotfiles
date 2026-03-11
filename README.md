# Dotfiles

Personal config files for macOS, Fedora and Debian.
No symlinks, just bash scripts that copy files to your home directory.

## Quick start

```bash
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles
export DEV_ENV=~/.dotfiles

./init           # Install Homebrew (macOS only)
./dev-env        # Preview config sync
./dev-env -f     # Sync configs to home
./run --dry      # Preview setup scripts
./run            # Run setup scripts
```

## Structure

```
.dotfiles/
├── dev-env       # Sync configs between repo and home
├── run           # Run OS-specific setup scripts
├── init          # Initial setup (Homebrew)
├── cl            # Fuzzy command launcher
├── env/          # Dotfiles (zsh, tmux, git, vim, lazygit, etc.)
├── runs/         # OS-specific installers (mac, fedora, debian)
├── lib/          # Shared bash utilities
└── misc-configs/ # Browser extensions, VS Code profiles
```

## Scripts

### dev-env

Syncs dotfiles between repo and home directory.

```bash
./dev-env           # Preview changes (dry run)
./dev-env --diff    # Show file differences
./dev-env -f        # Push configs to home
./dev-env pull -f   # Pull configs from home to repo
```

---

### run

Executes setup scripts from `runs/` based on detected OS.

```bash
./run --dry    # Preview what will run
./run          # Run all setup scripts
./run nvim     # Run only scripts matching "nvim"
```

---

### cl

Fuzzy command launcher for saved commands.

```bash
cl        # Launch picker
cl add    # Add new command
cl edit   # Edit commands in nvim
```

Commands are stored in `~/.cl-commands` with format `command:::description`.

---

### tmux-sessionizer

Fuzzy-find and switch tmux sessions for project directories.

| Binding | Context |
|---------|---------|
| `Ctrl+f` | Shell |
| `prefix+f` | Tmux |

Creates new session if needed, switches if exists. Supports `.tmux-sessionizer` file in project root for startup commands.

## Configs included

| Config | Notes |
|--------|-------|
| zsh | oh-my-zsh, robbyrussell theme |
| tmux | `Ctrl+a` prefix, vi mode, lazygit popup (`prefix+g`) |
| git | git-delta for diffs, useful aliases |
| vim | True color, airline |
| lazygit | Dracula theme |

## Setup scripts by OS

| macOS | Fedora | Debian |
|-------|--------|--------|
| git, gh, rectangle, iterm2, lazygit | docker, lazygit | docker, tmux |
| volta, node | nvim, fzf, ripgrep, git-delta | nvim, fzf, ripgrep |
| nvim, fzf, ripgrep, git-delta | zsh, oh-my-zsh | zsh, oh-my-zsh |
| zsh, oh-my-zsh | | |

## Dependencies

- `fzf` - fuzzy finding
- `tmux` - terminal multiplexer
- `git-delta` - better diffs
- `lazygit` - git TUI
- `oh-my-zsh` - zsh framework
