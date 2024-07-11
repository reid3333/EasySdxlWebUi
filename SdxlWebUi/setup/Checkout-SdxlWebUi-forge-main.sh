#!/bin/bash

# Set the script to exit immediately if any command fails
set -e

# Change to the parent directory of the script's location
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd "$SCRIPT_DIR/.."

# Checkout the main_29be1da branch in the stable-diffusion-webui-forge repository
echo "git -C stable-diffusion-webui-forge checkout -b main_29be1da 29be1da"
git -C stable-diffusion-webui-forge checkout -b main_29be1da 29be1da

# Check if the previous command failed
if [ $? -ne 0 ]; then
  echo "git -C stable-diffusion-webui-forge checkout -f main_29be1da"
  git -C stable-diffusion-webui-forge checkout -f main_29be1da
fi

# Check if the previous command failed
if [ $? -ne 0 ]; then
  exit $?
fi
