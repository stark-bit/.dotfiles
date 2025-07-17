# Dotfiles


My personal config files for MacOS, Fedora and Debian.
No symlinks, just a simple bash script deleting and copying files over.

[What are .dotfiles?](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/)

## Overview

- `run`: A script that executes setup scripts based on the detected operating system.
- `dev-env`: A script that copies dotfiles and configurations into the home directory.
- `runs/`: A directory containing setup scripts for different operating systems (macOS, Fedora, Debian) and tools (zsh, nvim, tmux, Docker).
- `env/`: A directory containing the actual dotfiles and configurations.

## Usage

Run `init` before running `dev-env` or `run` scripts.
Run `dev-env --dry` and `run --dry` to see a log of actions that will be performed


