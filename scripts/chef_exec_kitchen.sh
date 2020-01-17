#!/bin/bash

function chefValidate {
  echo "Running kitchen test"
  chef gem list -l
  kitchen diagnose --all
  chefOutput=$(chef exec kitchen test --destroy=always ${*} 2>&1)
  chefExitCode=${?}
  cat .kitchen/logs/kitchen.log

  # kitchen exit 0 means all good
  if [ ${chefExitCode} -eq 0 ]; then
    echo "Passed kitchen test"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi

  # kitchen exit anything else is bad
  if [ ${chefExitCode} -ne 0 ]; then
    echo "Failed kitchen test"
    echo "${chefOutput}"
    echo
    exit "${chefExitCode}"
  fi

}
