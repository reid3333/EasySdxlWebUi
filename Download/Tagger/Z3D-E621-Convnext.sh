#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/toynya/Z3D-E621-Convnext

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/TaggerOnnx" || exit

# Download the files using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" Z3D-E621-Convnext Z3D-E621-Convnext.onnx \
https://huggingface.co/toynya/Z3D-E621-Convnext/resolve/main/model.onnx
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" Z3D-E621-Convnext tags-selected.csv \
https://huggingface.co/toynya/Z3D-E621-Convnext/resolve/main/tags-selected.csv
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
