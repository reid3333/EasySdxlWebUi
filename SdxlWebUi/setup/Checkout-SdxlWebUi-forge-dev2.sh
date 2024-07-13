#!/bin/bash

# Set the script to exit immediately if any command fails
set -e

# Change to the parent directory of the script's location
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd "$SCRIPT_DIR/.."

# Checkout the dev2_77bdb92 branch in the stable-diffusion-webui-forge repository
echo "git -C stable-diffusion-webui-forge checkout -b dev2_77bdb92 77bdb92"
git -C stable-diffusion-webui-forge checkout -b dev2_77bdb92 77bdb92

# Check if the previous command failed
if [ $? -ne 0 ]; then
  echo "git -C stable-diffusion-webui-forge checkout -f dev2_77bdb92"
  git -C stable-diffusion-webui-forge checkout -f dev2_77bdb92
fi

# Check if the previous command failed
if [ $? -ne 0 ]; then
  exit $?
fi