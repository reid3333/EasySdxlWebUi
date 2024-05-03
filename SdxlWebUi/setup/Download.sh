#!/bin/bash

# スクリプトのディレクトリを取得
script_dir=$(dirname "$(realpath "$0")")

# 文字コード設定
export LANG=ja_JP.UTF-8

# 引数から変数を設定
DOWNLOAD_DIR="$1"
DOWNLOAD_FILE="$2"
DOWNLOAD_URL="$3"

# ダウンロードディレクトリが存在しない場合、作成
if [ ! -d "${DOWNLOAD_DIR}" ]; then
    mkdir -p "${DOWNLOAD_DIR}"
fi

# ファイルが既に存在し、.aria2 ファイルが存在しない場合、終了
if [ -f "${DOWNLOAD_DIR}/${DOWNLOAD_FILE}" ] && [ ! -f "${DOWNLOAD_DIR}/${DOWNLOAD_FILE}.aria2" ]; then
    exit 0
fi

# ファイルをダウンロード
curl -L -o "${DOWNLOAD_DIR}/${DOWNLOAD_FILE}" "${DOWNLOAD_URL}"
if [ $? -ne 0 ]; then
    echo "Download failed"
    exit 1
fi
