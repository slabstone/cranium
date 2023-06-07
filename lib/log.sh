#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Colored logger library, wrapper over 'colors' library.

# shellcheck source-path=SCRIPTDIR
source "$(dirname "${BASH_SOURCE[0]}")/colors.sh"

#######################################
# Display line of text in predefined color, depending on level
# Arguments:
#   Log level: info, warning, error
#   Line of text to display
# Outputs:
#   Line of text to stdout ('info', 'warning') or stderr ('error')
#######################################
function log::message() {
  declare -r level=${1:-}
  declare -r message=${2:-}

  local color_name=''
  case ${level} in
    i | info) color_name='green' ;;
    w | warning) color_name='yellow' ;;
    e | error) color_name='red' ;;
    *)
      echo "unknown level: ${level}"
      color_name='default'
      ;;
  esac
  readonly color_name

  colors::echo "${message}" "${color_name}"
}

#######################################
# Shorthand functions
#######################################
function log::info() {
  log::message 'info' "$1"
}

function log::warning() {
  log::message 'warning' "$1"
}

function log::error() {
  log::message 'error' "$1" >&2
}

function log::i() {
  log::message 'i' "$1"
}

function log::w() {
  log::message 'w' "$1"
}

function log::e() {
  log::message 'e' "$1" >&2
}
