#!/bin/bash

echo "Starting..."

# Open the URLs in the default web browser
#xdg-open https://huggingface.co/kataragi/controlnetXL_inpaint
#xdg-open https://huggingface.co/kataragi/ControlNet-LineartXL

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/ControlNet" || exit

# Download files using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" . Kataragi_inpaintXL-fp16.safetensors \
https://huggingface.co/kataragi/controlnetXL_inpaint/resolve/main/Kataragi_inpaintXL-fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" . Kataragi_inpaintXL-lora128.safetensors \
https://huggingface.co/kataragi/controlnetXL_inpaint/resolve/main/Kataragi_inpaintXL-lora128.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" . Katarag_lineartXL-fp16.safetensors \
https://huggingface.co/kataragi/ControlNet-LineartXL/resolve/main/Katarag_lineartXL-fp16.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" . Kataragi_lineartXL-lora128.safetensors \
https://huggingface.co/kataragi/ControlNet-LineartXL/resolve/main/Kataragi_lineartXL-lora128.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
