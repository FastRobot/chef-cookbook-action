#!/bin/bash

function chefValidate {
  echo "Running kitchen test"
  # some if-the-driver-is-docker logic
  apt update && apt install -y docker.io
  docker info
  chef gem install kitchen-docker -v 2.9.0
  chefOutput=$(chef exec kitchen test --destroy=always ${*} 2>&1)
  chefExitCode=${?}

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
    cat .kitchen/logs/kitchen.log
    exit "${chefExitCode}"
  fi

}
