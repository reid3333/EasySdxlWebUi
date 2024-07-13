#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/2vXpSwA7/iroiro-lora

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/ControlNet" || exit

# Download files using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" . cnlllite-anystyle_v3-step00004000.safetensors \
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/test_controlnet/cnlllite-anystyle_v3-step00004000.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" . CN-anytest_v1_fp16.safetensors \
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/test_controlnet/CN-anytest_v1_fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download-HuggingFace.sh" . 2vXpSwA7/iroiro-lora test_controlnet2/CN-anytest_v3-50000_*.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download-HuggingFace.sh" . 2vXpSwA7/iroiro-lora test_controlnet2/CN-anytest_v4-marged_*.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
