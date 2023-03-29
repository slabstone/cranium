#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function args::help() {
  [[ $# -eq 0 || $1 == '-h' || $1 == '--help' ]]
}
