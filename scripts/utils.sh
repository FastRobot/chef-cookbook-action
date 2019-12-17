#!/bin/bash

set -ou

function parseInputs {
  # Required inputs
  if [ "${INPUT_CHEF_ACTIONS_TASK}" != "" ]; then
    chefTask=${INPUT_CHEF_ACTIONS_TASK}
  else
    echo "Input chef_task cannot be empty"
    exit 1
  fi

  # Optional inputs
  chefWorkingDir="."
  if [ "${INPUT_CHEF_ACTIONS_WORKING_DIR}" != "" ] || [ "${INPUT_CHEF_ACTIONS_WORKING_DIR}" != "." ]; then
    chefWorkingDir=${INPUT_CHEF_ACTIONS_WORKING_DIR}
  fi

  chefComment=0
  if [ "${INPUT_CHEF_ACTIONS_COMMENT}" == "1" ] || [ "${INPUT_CHEF_ACTIONS_COMMENT}" == "true" ]; then
    chefComment=1
  fi

  chefAPIusername=""
  if [ "${INPUT_CHEF_ACTIONS_API_USERNAME}" != "" ]; then
    chefAPIusername=${INPUT_CHEF_ACTIONS_API_USERNAME}
  fi

  # something for the pem as a secret is needed here
}
