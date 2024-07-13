#!/bin/bash

SETUP=$(readlink -f "$(dirname "$0")/SdxlWebUi/setup")

# Clone or pull the IC-Light repository
pushd "$(dirname "$0")" || exit 1
echo "Cloning or pulling the IC-Light repository"
"${SETUP}/GitCloneOrPull.sh" https://github.com/lllyasviel/IC-Light
if [ $? -ne 0 ]; then
  popd
  exit 1
fi
popd

# Navigate to the IC-Light directory and activate the virtual environment
pushd "$(dirname "$0")/IC-Light" || exit 1
"${SETUP}/ActivateVirtualEnvironment.sh"
if [ $? -ne 0 ]; then
  popd
  exit 1
fi

# Install PyTorch and dependencies
echo "Installing PyTorch and dependencies"
pip install -q torch torchvision --index-url https://download.pytorch.org/whl/cu121
if [ $? -ne 0 ]; then
  echo "Error: Failed to install PyTorch" >&2
  popd
  exit 1
fi

# Install other requirements
echo "Installing other requirements"
pip install -q -r requirements.txt
if [ $? -ne 0 ]; then
  echo "Error: Failed to install requirements" >&2
  popd
  exit 1
fi

# Start the demo
echo "Starting the demo"
sleep 10 && echo "http://localhost:7860" &
python gradio_demo.py

popd
