#!/bin/bash

function chefSpec {
  echo "Running rspec"
  chefOutput=$(chef exec rspec ${*} 2>&1)
  chefExitCode=${?}

  # rspec exit 0 means all good
  if [ ${chefExitCode} -eq 0 ]; then
    echo "rspec unit tests passed"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi

  # Exit code of !0 indicates failure.
  if [ ${chefExitCode} -ne 0 ]; then
    echo "not happy with the rspec:"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi
}
