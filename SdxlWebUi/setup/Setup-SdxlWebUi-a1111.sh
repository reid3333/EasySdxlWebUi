#!/bin/bash

set -e

export LANG=ja_JP.UTF-8

SCRIPT_DIR=$(dirname $(realpath "$0"))

pushd "$SCRIPT_DIR/.."

bash "$SCRIPT_DIR"/GitCloneOrPull.sh https://github.com/AUTOMATIC1111/stable-diffusion-webui master
git -C stable-diffusion-webui fetch origin pull/15821/head:PerfBundle

source "$SCRIPT_DIR"/ActivateVirtualEnvironment.sh venv-a1111

echo "python -m pip install -qq --upgrade pip"
python -m pip install -qq --upgrade pip

popd

bash "$SCRIPT_DIR"/Setup-SdxlWebUi-Common.sh stable-diffusion-webui a1111

pushd "$SCRIPT_DIR/../stable-diffusion-webui/extensions"

bash "$SCRIPT_DIR"/GitCloneOrPull.sh https://github.com/Bing-su/adetailer
bash "$SCRIPT_DIR"/GitCloneOrPull.sh https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
bash "$SCRIPT_DIR"/GitCloneOrPull.sh https://github.com/Mikubill/sd-webui-controlnet

popd

