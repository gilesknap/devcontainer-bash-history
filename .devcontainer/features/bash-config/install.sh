#!/bin/bash

# abort on error
set -e

# discover where this install.sh and its peers have been extracted to
this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


echo "Activating feature 'bash-config'"
echo "User: ${_REMOTE_USER}     User home: ${_REMOTE_USER_HOME}"

# This script is run at container build time.
#
# Here we place all the configuration files in a staging area.
#
# Then at container runtime, when the hosts' config folder is mounted in, we
# can copy from the staging area to the mounted host folder
#
# The runtime copy to host folder is performed once only by onCreateCommand.sh

mkdir -p "$CONFIG_STAGING"
cp -r "$this_dir"/config/* "$CONFIG_STAGING"

