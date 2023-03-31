#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# File utility library.

# shellcheck source-path=SCRIPTDIR
source "$(dirname "${BASH_SOURCE[0]}")/log.sh"

#######################################
# Check if file exists and is a regular file ('test -f' wrapper)
# Arguments:
#   Filename
# Outputs:
#   stderr: error message if check fails
# Returns:
#   0 if check succeeds, 1 otherwise
#######################################
function file::check() {
  if [[ ! -f $1 ]]; then
    log::e "$1: not a file"
    return 1
  fi
}
