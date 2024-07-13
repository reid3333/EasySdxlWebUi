#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/bdsqlsz/qinglong_controlnet-lllite

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/ControlNet" || exit

# Download files using wget or curl (assuming Download-HuggingFace.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download-HuggingFace.sh" . bdsqlsz/qinglong_controlnet-lllite "*.safetensors"
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
