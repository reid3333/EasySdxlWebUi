#!/bin/bash

SDXL_WEB_UI=$(readlink -f "$(dirname "$0")/SdxlWebUi")
STABLE_DIFFUSION_WEBUI_DIR="$SDXL_WEB_UI/stable-diffusion-webui"
VENV_DIR="$SDXL_WEB_UI/venv-a1111"
SETUP_DIR="$SDXL_WEB_UI/setup"

if [ ! -d "$STABLE_DIFFUSION_WEBUI_DIR" ] || [ ! -d "$VENV_DIR" ]; then
    "$SETUP_DIR/Setup-SdxlWebUi-a1111.sh"
fi

if [ $? -ne 0 ]; then
    exit $?
fi

pushd "$STABLE_DIFFUSION_WEBUI_DIR" || exit 1

PYTHON="$VENV_DIR/bin/python"
GIT=$(which git)

if [ -z "$GIT" ]; then
    GIT="$SETUP_DIR/lib/PortableGit/bin/git"
fi

export PYTORCH_CUDA_ALLOC_CONF="garbage_collection_threshold:0.75,max_split_size_mb:128"

# VRAM が足りない場合に以下を COMMANDLINE_ARGS 追加。生成が数割遅くなり、メインメモリの消費量も数GB増える。
# --medvram-sdxl

COMMANDLINE_ARGS="--styles-file ../styles.csv --gradio-allowed-path .. --xformers"

# 起動時に操作不能になる件への対策
if [ -z "$DISABLE_LISTEN_AUTOLAUNCH" ]; then
    echo "http://localhost:7860/"
    COMMANDLINE_ARGS="$COMMANDLINE_ARGS --listen --autolaunch --enable-insecure-extension-access"
fi

COMMANDLINE_ARGS="$COMMANDLINE_ARGS $*"

# 手元で優位性を確認できず。
# --opt-sdp-no-mem-attention --opt-sdp-attention --opt-channelslast

if [ ! -f config.json ]; then
    cp -f "$SETUP_DIR/res/config-a1111.json" config.json
fi
"$PYTHON" "$SETUP_DIR/update_json.py" "$SDXL_WEB_UI/config.json" config.json
if [ $? -ne 0 ]; then
    read -n 1 -s -r -p "Press any key to continue"
    popd
    exit $?
fi

if [ ! -f ui-config.json ]; then
    cp -f "$SETUP_DIR/res/ui-config-a1111.json" ui-config.json
fi
"$PYTHON" "$SETUP_DIR/update_json.py" "$SDXL_WEB_UI/ui-config.json" ui-config.json
if [ $? -ne 0 ]; then
    read -n 1 -s -r -p "Press any key to continue"
    popd
    exit $?
fi

echo "webui.sh $COMMANDLINE_ARGS"
"./webui.sh" $COMMANDLINE_ARGS

popd
