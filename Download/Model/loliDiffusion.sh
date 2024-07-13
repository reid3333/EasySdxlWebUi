#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/JosefJilek/loliDiffusion

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Model" || exit

# Download the file using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" Pony loliDiffusionV1.1.0_PDXL_Lx7-CLIP_VAE_FP16.safetensors \
https://huggingface.co/JosefJilek/loliDiffusion/resolve/main/loliDiffusionV1.1.0_PDXL_Lx7-CLIP_VAE_FP16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
