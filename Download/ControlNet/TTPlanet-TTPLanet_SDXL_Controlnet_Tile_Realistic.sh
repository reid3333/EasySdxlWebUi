#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/TTPlanet/TTPLanet_SDXL_Controlnet_Tile_Realistic

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/ControlNet" || exit

# Download files using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" . TTPLANET_Controlnet_Tile_realistic_v1_fp16.safetensors \
https://huggingface.co/TTPlanet/TTPLanet_SDXL_Controlnet_Tile_Realistic/resolve/main/TTPLANET_Controlnet_Tile_realistic_v1_fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" . TTPLANET_Controlnet_Tile_realistic_v2_fp16.safetensors \
https://huggingface.co/TTPlanet/TTPLanet_SDXL_Controlnet_Tile_Realistic/resolve/main/TTPLANET_Controlnet_Tile_realistic_v2_fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
