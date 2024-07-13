#!/bin/bash

echo "Starting..."

# Open the URLs in the default web browser
# xdg-open https://huggingface.co/2vXpSwA7/iroiro-lora
# xdg-open https://note.com/2vxpswa7/n/n046c3e928f1e

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Lora" || exit

# Download files using wget or curl (assuming Download-HuggingFace.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download-HuggingFace.sh" iroiro 2vXpSwA7/iroiro-lora sdxl/*
if [ $? -ne 0 ]; then popd; exit $?; fi

# Move files
mv -f iroiro/sdxl/* iroiro
if [ $? -ne 0 ]; then popd; exit $?; fi

# Remove the directory
rm -rf iroiro/sdxl
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
