#!/bin/bash

echo "Starting..."

# Open the URLs in the default web browser
# xdg-open https://huggingface.co/ByteDance/SDXL-Lightning
# xdg-open https://huggingface.co/latent-consistency/lcm-lora-sdv1-5

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Lora" || exit

# Download the files using wget or curl (assuming Download-HuggingFace.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download-HuggingFace.sh" SDXL-Lightning ByteDance/SDXL-Lightning "*_lora.safetensors"
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" lcm lcm-lora-sd15.safetensors \
https://huggingface.co/latent-consistency/lcm-lora-sdv1-5/resolve/main/pytorch_lora_weights.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
