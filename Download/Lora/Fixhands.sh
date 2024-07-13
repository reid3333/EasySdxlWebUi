#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Lora" || exit

# Download the file using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" . Fixhands_anime_bdsqlsz_V1.safetensors \
https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2/resolve/main/Fixhands_anime_bdsqlsz_V1.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
