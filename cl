#!/bin/bash

COMMAND_FILE="$HOME/.cl-commands"

if [[ ! -f "$COMMAND_FILE" ]]; then
  echo "Command file not found at $COMMAND_FILE"
  exit 1
fi

cl_run() {
  selected=$(while IFS= read -r line; do
    echo "$line"
  done < "$COMMAND_FILE" \
  | awk -F ':::' '{printf "%-60s # %s\n", $1, $2}' \
  | fzf --prompt="Select command: " --ansi)

  if [[ -n "$selected" ]]; then
    cmd=$(echo "$selected" | cut -d'#' -f1 | sed 's/[[:space:]]*$//')
    
    if [[ "$cmd" == *"{}"* ]]; then
      read -e -p "Argument: " arg
      cmd="${cmd//\{\}/$arg}"
    fi
    
    echo -e "\n Running: $cmd\n"
    eval "$cmd"
  fi
}

cl_add() {
  read -p "Command (use {} for argument): " cmd
  if [[ -z "$cmd" ]]; then
    echo "No command provided"
    exit 1
  fi
  read -p "Description: " desc
  if [[ -z "$desc" ]]; then
    echo "No description provided"
    exit 1
  fi
  echo "$cmd:::$desc" >> "$COMMAND_FILE"
  echo "Added: $cmd ($desc)"
}

cl_edit() {
  nvim "$COMMAND_FILE"
}

case "$1" in
  add)  cl_add ;;
  edit) cl_edit ;;
  *)    cl_run ;;
esac
