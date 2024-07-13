#!/bin/bash

echo "https://twitter.com/8co28/status/1793460439059485169"

SDXL_WEB_UI=$(readlink -f "$(dirname "$0")/../../SdxlWebUi")
cd "${SDXL_WEB_UI}/ControlNet" || exit 1

"${SDXL_WEB_UI}/setup/Download.sh" . controlnet852AClone_v10.safetensors https://civitai.com/api/download/models/515749
if [ $? -ne 0 ]; then
  exit 1
fi

"${SDXL_WEB_UI}/setup/Download.sh" . controlnet852A_normal.safetensors https://civitai.com/api/download/models/507015
if [ $? -ne 0 ]; then
  exit 1
fi

"${SDXL_WEB_UI}/setup/Download.sh" . controlnet852A_hard.safetensors https://civitai.com/api/download/models/506983
if [ $? -ne 0 ]; then
  exit 1
fi

"${SDXL_WEB_UI}/setup/Download.sh" . controlnet852A_veryhard.safetensors https://civitai.com/api/download/models/506961
if [ $? -ne 0 ]; then
  exit 1
fi

cd - || exit 1
