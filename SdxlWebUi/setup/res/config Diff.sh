#!/bin/bash

export LANG=ja_JP.UTF-8

DIFF_CMD="/usr/bin/diff"

script_dir="$(dirname "$(readlink -f "$0")")"
src_config="${script_dir}/config.json"
dst_config="$1"

if [ ! -f "$src_config" ]; then
    echo "${src_config} が見つかりません。"
    read -p "Press enter to continue"
    exit 1
fi

if [ -z "$dst_config" ]; then
    echo "すぐ横の config.json をコピー(Ctrl + C, Ctrl + V)してから Web UI で設定を保存します。"
    echo "更新されたconfig.jsonとコピーとの差分を SdxlWebUi/config.json に書き足してください。"
    read -p "Press enter to continue"
    exit 1
fi

$DIFF_CMD "$src_config" "$dst_config"
read -p "Press enter to continue"
