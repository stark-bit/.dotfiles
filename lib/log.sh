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
        if (( tgt_size > src_size )); then
            local diff=$(( tgt_size - src_size ))
            local src_short="${src#$DEV_ENV}"
            warn_count=$(( warn_count + 1 ))
            echo "[$warn_count] WARNING"
            echo "  target: $tgt"
            echo "  source: $src_short"
            echo "  target is $diff bytes larger ($tgt_size vs $src_size bytes)"
            echo "  will be overwritten with less content"
            echo ""
        fi
    fi
}
