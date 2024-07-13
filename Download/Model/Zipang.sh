#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Model" || exit

# Download the files using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" Anmg zipang_XL_test3.1.fp16.safetensors \
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/zipang_XL_test3.1.fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Pony ponypang_XL_test02.fp16.safetensors \
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/ponypang_XL_test02.fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

pushd "$SDXL_WEB_UI/Lora" || exit

"$SDXL_WEB_UI/setup/Download.sh" Zipang myjc_v1_XL.safetensors \
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/myjc_v1_XL.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Zipang myjs_XL_zipang_test03.safetensors \
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/myjs_XL_zipang_test03.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Zipang myjs_XL_popang02.safetensors \
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/myjs_XL_popang02.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
