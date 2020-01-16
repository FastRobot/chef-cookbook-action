#!/bin/bash -l

set -o errexit
set -o pipefail

function main {
  # Source the other files to gain access to their functions
  scriptDir="$(dirname "${0}")/scripts"
  # shellcheck source=scripts/utils.sh
  source "${scriptDir}/utils.sh"
  # shellcheck source=scripts/chef_exec_cookstyle.sh
  source "${scriptDir}/chef_exec_cookstyle.sh"
  # shellcheck source=scripts/chef_exec_foodcritic.sh
  source "${scriptDir}/chef_exec_foodcritic.sh"

  parseInputs
  cd "${GITHUB_WORKSPACE}"/"${chefWorkingDir}"

  case "${chefTask}" in
    lint)
      chefCookStyle "$@"
      chefFoodcritic "$@"
      ;;
    spec)
      chefSpec "$@"
      ;;
    kitchen)
      chefValidate "$@"
      ;;
    berks)
      chefBerks "$@"
      ;;
    tag_and_publish)
      chefTBD "$@"
      ;;
    *)
      echo "Error: Must provide a valid value for chef_task"
      exit 1
      ;;
  esac
}

main "$@"
