#!/bin/bash

set -oe

function chefFoodcritic {
  echo "Running foodcritic"
  chef exec foodcritic .
  chefOutput=$(chef exec foodcritic ${chefWorkingDir} ${*} 2>&1)
  chefExitCode=${?}

  # chef exec footcritic exit 0 means all good
  if [ ${chefExitCode} -eq 0 ]; then
    echo "Foodcritic gives you an A+ (all rules pass)"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi

}
