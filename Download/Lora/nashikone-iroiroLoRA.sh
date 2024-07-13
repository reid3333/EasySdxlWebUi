#!/bin/bash

echo "Starting..."

# Open the URLs in the default web browser
#xdg-open https://huggingface.co/nashikone/iroiroLoRA/blob/main/Animagine-xl_3.0_LoRAReadme.txt
#xdg-open https://huggingface.co/nashikone/iroiroLoRA/blob/main/ponyDiffusionV6XL_LoRAReadme.txt

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Lora" || exit

# Download the files using wget or curl (assuming Download-HuggingFace.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download-HuggingFace.sh" nashikone nashikone/iroiroLoRA
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
