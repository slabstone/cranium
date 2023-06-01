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
  [[ $# -eq 0 ]] || args::is_help "$1"
}

#######################################
# Checks if string looks like help request argument (-h, --help, ...)
# Arguments:
#   String to check
# Returns:
#   0 if string looks like help request argument, 1 otherwise
#######################################
function args::is_help() {
  [[ $1 == '-h' || $1 == '--help' || $1 == 'help' ]]
}

#######################################
# Prints usage string
# Arguments:
#   * parent script name (i.e. "$0")
#   * script arguments docstring
# Outputs:
#   stdout: usage string
# Returns:
#   Always fails
#######################################
function args::usage() {
  echo "usage: $(basename "$1") $2"
  return 1
}
