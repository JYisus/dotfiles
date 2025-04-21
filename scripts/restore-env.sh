#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd )"

BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
LIGHT_GRAY="\033[0;37m"
DARK_GRAY="\033[1;30m"
LIGHT_RED="\033[1;31m"
LIGHT_GREEN="\033[1;32m"
LIGHT_YELLOW="\033[1;33m"
LIGHT_BLUE="\033[1;34m"
LIGHT_PURPLE="\033[1;35m"
LIGHT_CYAN="\033[1;36m"
WHITE="\033[1;37m"
NC="\033[0m"

runs_dir="$script_dir/../dev-env/runs"
steps=(libs languages tools)
grep=""
dry_run="0"

while [[ $# -gt 0 ]]; do
    echo "ARG: \"$1\""
    if [[ "$1" == "--dry" ]]; then
        dry_run="1"
    else
        grep="$1"
    fi
    shift
done

log() {
	if [[ $dry_run = "1" ]]; then
		echo "[DRY_RUN]: $1"
	else
		echo "$1"
	fi
}

log "RUN: env: $end -- grep: $grep"

for step in "${steps[@]}"; do
	echo -e $BLUE"Installing $step...$NC"
	step_dir=`find $runs_dir/$step -mindepth 1 -maxdepth 1 -executable`
	
	for s in $step_dir; do
		if echo "$s" | grep -vq "$grep"; then
			log "grep \"$grep\" filtered out $s"
			continue
		fi

		log "running script: $s"

		if [[ $dry_run == "0" ]]; then
			$s
		fi
	done
done
