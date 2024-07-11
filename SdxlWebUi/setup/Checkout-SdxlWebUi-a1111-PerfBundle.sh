#!/bin/bash

# Set the script to exit immediately if any command fails
set -e

# Change to the parent directory of the script's location
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd "$SCRIPT_DIR/.."

# Checkout the PerfBundle branch in the stable-diffusion-webui repository
echo "git -C stable-diffusion-webui checkout PerfBundle"
git -C stable-diffusion-webui checkout PerfBundle

# Check if the previous command failed
if [ $? -ne 0 ]; then
  exit $?
fi
