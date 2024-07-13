#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/tsukihara/xl_model

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Model" || exit

# Download the files using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" Pony ebara_pony_2.1.safetensors \
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_2.1.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Pony ebara_pony_2.1.png \
https://huggingface.co/tsukihara/xl_model/resolve/main/sample/ebara_pony_2.jpg
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Pony ebara_pony_2.safetensors \
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_2.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Pony ebara_pony_2.png \
https://huggingface.co/tsukihara/xl_model/resolve/main/sample/ebara_pony_2.jpg
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Pony ebara_pony_1.bakedVAE.safetensors \
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.bakedVAE.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Pony ebara_pony_1.bakedVAE.png \
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.png
if [ $? -ne 0 ]; then popd; exit $?; fi

# The following lines are commented out as in the original batch file
# "$SDXL_WEB_UI/setup/Download.sh" Pony ebara_pony_1.safetensors \
# https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.safetensors
# if [ $? -ne 0 ]; then popd; exit $?; fi

# "$SDXL_WEB_UI/setup/Download.sh" Pony ebara_pony_1.png \
# https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.png
# if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
