#!/bin/bash

# Expects the caller to set:
#   dry_run   ("0" or "1")
#   warn_only ("0" or "1")

warn_count=0

log() {
    if [[ $dry_run == "1" ]]; then
        echo "[DRY_RUN]: $1"
    else
        echo "$1"
    fi
}

warn_size() {
    local src="$1"
    local tgt="$2"
    if [[ -f "$tgt" && -f "$src" ]]; then
        local src_size=$(wc -c < "$src")
        local tgt_size=$(wc -c < "$tgt")
        if (( src_size != tgt_size )); then
            local name=$(basename "$src")
            local tgt_short="${tgt/#$HOME/~}"
            local diff
            local verb
            if (( src_size > tgt_size )); then
                diff=$(( src_size - tgt_size ))
                verb="GAIN"
            else
                diff=$(( tgt_size - src_size ))
                verb="LOSE"
            fi
            local dir_label="pushing"
            if [[ $direction == "pull" ]]; then
                dir_label="pulling"
            fi
            warn_count=$(( warn_count + 1 ))
            echo "[$warn_count] WARNING ($dir_label) $name -- will $verb $diff bytes"
            echo "  target: $tgt_short"
            echo ""
        fi
    fi
}
