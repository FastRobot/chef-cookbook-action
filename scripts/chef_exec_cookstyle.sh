#!/bin/bash

set -euo pipefail

function chefCookStyle {
  echo "Running cookstyle"
  chefOutput=$(chef exec cookstyle ${*} 2>&1)
  chefExitCode=${?}

  # cookstyle exit 0 means all good
  if [ ${chefExitCode} -eq 0 ]; then
    echo "CookStyle formatting OK"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi

  # Exit code of !0 indicates failure.
  if [ ${chefExitCode} -ne 0 ]; then
    echo "CookStyle is not happy:"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi
}
