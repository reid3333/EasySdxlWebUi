#!/bin/bash

echo "Starting..."

# Open the URLs in the default web browser
# xdg-open https://huggingface.co/cagliostrolab/animagine-xl-3.1
# xdg-open https://cagliostrolab.net/posts/animagine-xl-v31-release

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Model" || exit

# Download the file using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" Anmg animagine-xl-3.1.safetensors \
https://huggingface.co/cagliostrolab/animagine-xl-3.1/resolve/main/animagine-xl-3.1.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
