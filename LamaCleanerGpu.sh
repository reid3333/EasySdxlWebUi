#!/bin/bash

SDXL_WEB_UI=$(readlink -f "$(dirname "$0")/SdxlWebUi")
LAMA_CLEANER_DIR="$SDXL_WEB_UI/setup/lib/lama-cleaner"

if [ ! -d "$LAMA_CLEANER_DIR" ]; then
    mkdir -p "$LAMA_CLEANER_DIR"
    pushd "$LAMA_CLEANER_DIR" || exit 1
    source "$SDXL_WEB_UI/setup/ActivateVirtualEnvironment.sh"
    pip install torch==1.13.1+cu117 torchvision==0.14.1 --extra-index-url https://download.pytorch.org/whl/cu117
    pip install lama-cleaner
    popd
fi

pushd "$LAMA_CLEANER_DIR" || exit 1
source "$SDXL_WEB_UI/setup/ActivateVirtualEnvironment.sh"
echo "http://127.0.0.1:7859/"
lama-cleaner --model=lama --port=7859 --device=cuda
popd
