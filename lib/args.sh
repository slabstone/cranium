#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Command line arguments library.

#######################################
# Check script arguments and decide if help should be displayed, that is if:
#   * script requires arguments but none were provided
#   * first argument looks like help request
# Arguments:
#   Script arguments ($@)
# Returns:
#   0 if parent script should show help, 1 otherwise
# Note:
#   The only meaningful invocation of this function is: args::help "$@"
#######################################
function args::help() {
  [[ $# -eq 0 || $1 == '-h' || $1 == '--help' ]]
}
