#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# shellcheck source-path=SCRIPTDIR
source "$(dirname "${BASH_SOURCE[0]}")/colors.sh"

function log::info() {
  colors::green "$1"
}

function log::warning() {
  colors::yellow "$1"
}

function log::error() {
  colors::red "$1" >&2
}

function log::i() {
  colors::green "$1"
}

function log::w() {
  colors::yellow "$1"
}

function log::e() {
  colors::red "$1" >&2
}
