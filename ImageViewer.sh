#!/bin/bash

SDXL_WEB_UI=$(readlink -f "$(dirname "$0")/SdxlWebUi")
SETUP_LIB="$SDXL_WEB_UI/setup/lib"

pushd "$SETUP_LIB" || exit 1
if [ ! -d "GenImageViewer" ]; then
    source "$SDXL_WEB_UI/setup/SetGitPath.sh"
    git clone https://github.com/Zuntan03/GenImageViewer.git
    cp -f ../res/GenImageViewer.json ./GenImageViewer/GenImageViewer.json
    [ ! -d "$(dirname "$0")/output" ] && mkdir "$(dirname "$0")/output"
fi
popd

pushd "$SETUP_LIB/GenImageViewer" || exit 1
./GenImageViewer.sh
popd
