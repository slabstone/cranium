#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Colored output library, supports 8 original colors (foreground only).
# Set DISABLE_COLORS variable to disable colored output.

#######################################
# Assemble escape sequence string for color by color name
# Globals:
#   DISABLE_COLORS
# Arguments:
#   Color name
# Outputs:
#   Escape sequence string for color name or nothing if DISABLE_COLORS is set
#######################################
function colors::escape_sequence() {
  if [[ -v DISABLE_COLORS ]]; then
    return 0
  fi

  declare -r color_name=${1:-}
  declare -i color_code

  case ${color_name} in
    b | black)   color_code=30 ;;
    r | red)     color_code=31 ;;
    g | green)   color_code=32 ;;
    y | yellow)  color_code=33 ;;
    u | blue)    color_code=34 ;;
    m | magenta) color_code=35 ;;
    c | cyan)    color_code=36 ;;
    w | white)   color_code=37 ;;

    d | default | reset) color_code=39 ;;
    *) echo "unknown color: ${color_name}" >&2; color_code=39 ;;
  esac

  # shellcheck disable=SC2028 # we need literal '\e'
  echo "\\e[${color_code}m"
}

#######################################
# Display colored line of text
# Arguments:
#   Line of text to display
#   Color name (default: default color)
# Outputs:
#   stdout: line of text in selected color
#######################################
function colors::echo() {
  declare -r string=${1:-}
  declare -r color=${2:-d}

  declare -r start_sequence=$(colors::escape_sequence "${color}")
  declare -r end_sequence=$(colors::escape_sequence 'default')

  echo -e "${start_sequence}${string}${end_sequence}"
}

#######################################
# Display pangram in all colors, basically library test / example
# Arguments:
#   None
# Outputs:
#   stdout: pangram in all colors, thrice
#######################################
function colors::rainbow() {
  declare -r -a colors=(black red green yellow blue magenta cyan white)
  declare -r pangram='The quick brown fox jumps over the lazy dog.'

  for color in "${colors[@]}"; do
    colors::echo "${pangram}" "${color}"
  done

  colors::black "${pangram}"
  colors::red "${pangram}"
  colors::green "${pangram}"
  colors::yellow "${pangram}"
  colors::blue "${pangram}"
  colors::magenta "${pangram}"
  colors::cyan "${pangram}"
  colors::white "${pangram}"

  colors::b "${pangram}"
  colors::r "${pangram}"
  colors::g "${pangram}"
  colors::y "${pangram}"
  colors::u "${pangram}"
  colors::m "${pangram}"
  colors::c "${pangram}"
  colors::w "${pangram}"
}

#######################################
# Shorthand functions for colors
#######################################
function colors::black() {
  colors::echo "$1" 'black'
}

function colors::red() {
  colors::echo "$1" 'red'
}

function colors::green() {
  colors::echo "$1" 'green'
}

function colors::yellow() {
  colors::echo "$1" 'yellow'
}

function colors::blue() {
  colors::echo "$1" 'blue'
}

function colors::magenta() {
  colors::echo "$1" 'magenta'
}

function colors::cyan() {
  colors::echo "$1" 'cyan'
}

function colors::white() {
  colors::echo "$1" 'white'
}

function colors::b() {
  colors::echo "$1" 'b'
}

function colors::r() {
  colors::echo "$1" 'r'
}

function colors::g() {
  colors::echo "$1" 'g'
}

function colors::y() {
  colors::echo "$1" 'y'
}

function colors::u() {
  colors::echo "$1" 'u'
}

function colors::m() {
  colors::echo "$1" 'm'
}

function colors::c() {
  colors::echo "$1" 'c'
}

function colors::w() {
  colors::echo "$1" 'w'
}
