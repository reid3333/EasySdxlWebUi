#!/bin/bash
# UTF-8環境を設定
export LANG=ja_JP.UTF-8

# スクリプトのディレクトリを取得
BASE_DIR=$(dirname "$(readlink -f "$0")")

# ControlNetディレクトリに移動
pushd "$BASE_DIR/ControlNet" > /dev/null

# 各シェルスクリプトを順に実行
./2vXpSwA7-cnlllite-anystyle_v3.sh
./bdsqlsz-qinglong_controlnet-lllite.sh
./lllyasviel-sd_control_collection.sh
./TTPlanet-TTPLanet_SDXL_Controlnet_Tile_Realistic.sh

# 元のディレクトリに戻る
popd > /dev/null
