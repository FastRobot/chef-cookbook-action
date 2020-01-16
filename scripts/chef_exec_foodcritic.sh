#!/bin/bash

set -oe

function chefFoodcritic {
  echo "Running foodcritic"
  chef exec foodcritic .
  chefOutput=$(chef exec foodcritic ${chefWorkingDir} ${*} 2>&1)
  chefExitCode=${?}

  # chef exec footcritic exit 0 means all good
  if [ ${chefExitCode} -eq 0 ]; then
    echo "FoodCritic gives you an A+ (all rules pass)"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi

  # Exit code of !0 indicates failure.
  if [ ${chefExitCode} -ne 0 ]; then
    echo "FoodCritic is not happy:"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi

}
