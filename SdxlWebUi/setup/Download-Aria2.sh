#!/bin/bash

# 文字コード設定
export LANG=C.UTF-8

# 変数設定
DOWNLOAD_DIR="$1"
DOWNLOAD_FILE="$2"
DOWNLOAD_URL="$3"
ARIA_CMD="aria2c --console-log-level=warn --file-allocation=none -x2"

# ダウンロードディレクトリの確認と作成
[ ! -d "${DOWNLOAD_DIR}" ] && mkdir -p "${DOWNLOAD_DIR}"

# aria2のインストール確認と実行
if ! command -v aria2c &> /dev/null; then
    echo "aria2 is not installed. Installing aria2..."
    sudo apt-get update && sudo apt-get install -y aria2
    if [ $? -ne 0 ]; then
        echo "Failed to install aria2"
        exit 1
    fi
fi

# ファイルのダウンロード
if [ ! -f "${DOWNLOAD_DIR}/${DOWNLOAD_FILE}" ]; then
    ${ARIA_CMD} -o "${DOWNLOAD_DIR}/${DOWNLOAD_FILE}" "${DOWNLOAD_URL}"
    if [ $? -ne 0 ]; then
        echo "Download failed"
        exit 1
    fi
fi
