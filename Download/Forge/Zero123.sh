#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/stabilityai/stable-zero123

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/stable-diffusion-webui-forge/models/z123" || exit

# Download the file using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" . stable_zero123.ckpt \
https://huggingface.co/stabilityai/stable-zero123/resolve/main/stable_zero123.ckpt
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
