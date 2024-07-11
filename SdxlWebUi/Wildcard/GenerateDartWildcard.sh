#!/bin/bash

# Set the script to exit immediately if any command fails
set -e

# Change to the directory of the script's location
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd "$SCRIPT_DIR"

# Activate the virtual environment if it exists
if [ -d "../venv-forge/" ]; then
  source ../venv-forge/bin/activate
elif [ -d "../venv-a1111/" ]; then
  source ../venv-a1111/bin/activate
else
  echo "[ERROR] venv not found."
  exit 1
fi

# Run the Python script to generate Dart wildcard
python ../setup/generate_dart_wildcard.py

# Check if the previous command failed
if [ $? -ne 0 ]; then
  exit 1
fi
