# Dotfiles

My personal dotfiles for customizing my development environment.

The goal:  Be up and running on a new system in 5 minutes or less

## Overview

- `run`: A script that executes setup scripts based on the detected operating system.
- `dev-env`: A script that copies dotfiles and configurations into the home directory.
- `runs/`: A directory containing setup scripts for different operating systems (macOS, Fedora, Debian) and tools (zsh, nvim, tmux, Docker).
- `env/`: A directory containing the actual dotfiles and configurations.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
    ```

## Usage

Run `init` before running `dev-env` or `run` scripts. It is recommended to perform a dry run first to see what changes will be made without actually modifying any files. `--dry`
