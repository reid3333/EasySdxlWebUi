#!/bin/bash
# UTF-8環境を設定
export LANG=ja_JP.UTF-8

# スクリプトのディレクトリを取得
BASE_DIR=$(dirname "$(readlink -f "$0")")

# 各シェルスクリプトを順に実行
"$BASE_DIR/Download/DownloadAllControlNet.sh"
"$BASE_DIR/Download/DownloadAllForge.sh"
"$BASE_DIR/Download/DownloadAllImage.sh"
"$BASE_DIR/Download/DownloadAllLora.sh"
"$BASE_DIR/Download/DownloadAllModel.sh"
"$BASE_DIR/Download/DownloadAllTagger.sh"
