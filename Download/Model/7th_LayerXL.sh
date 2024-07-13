#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/syaimu/7th_Layer_XL

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Model" || exit

# Download the files using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" Anmg 7th_anime_XL-A-fp16.safetensors \
https://huggingface.co/syaimu/7th_Layer_XL/resolve/main/7th_anime_XL-A-fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Pony 7th_anime_XL-B-fp16.safetensors \
https://huggingface.co/syaimu/7th_Layer_XL/resolve/main/7th_anime_XL-B-fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
