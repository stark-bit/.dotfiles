#!/bin/bash

COMMAND_FILE="$HOME/.cl-commands"

# Check if the file exists
if [[ ! -f "$COMMAND_FILE" ]]; then
  echo "Command file not found at $COMMAND_FILE"
  exit 1
fi

# Read and show commands via fzf
selected=$(while IFS= read -r line; do
  echo "$line"
done < "$COMMAND_FILE" \
| awk -F ':::' '{printf "%-60s # %s\n", $1, $2}' \
| fzf --prompt="Select command: " --ansi)

# Extract and run selected command
if [[ -n "$selected" ]]; then
  cmd=$(echo "$selected" | cut -d'#' -f1 | sed 's/[[:space:]]*$//')
  echo -e "\n👉 Running: $cmd\n"
  eval "$cmd"
fi
