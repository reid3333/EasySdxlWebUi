#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://civitai.com/models/296650

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Model" || exit

# Download the file using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" Anmg rumblexlAnimagineBased_v13.safetensors \
https://civitai.com/api/download/models/400175
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
