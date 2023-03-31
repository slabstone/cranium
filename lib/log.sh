#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Colored logger library, wrapper over 'colors' library.

# shellcheck source-path=SCRIPTDIR
source "$(dirname "${BASH_SOURCE[0]}")/colors.sh"

#######################################
# Display line of text in predefined color, depending on level
# Arguments:
#   Line of text to display
# Outputs:
#   Line of text to stdout ('info', 'warning') or stderr ('error')
#######################################
function log::info() {
  colors::green "$1"
}

function log::warning() {
  colors::yellow "$1"
}

function log::error() {
  colors::red "$1" >&2
}

#######################################
# Shorthand functions
#######################################
function log::i() {
  colors::green "$1"
}

function log::w() {
  colors::yellow "$1"
}

function log::e() {
  colors::red "$1" >&2
}
