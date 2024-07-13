#!/bin/bash

set -e

# 現在のスクリプトのディレクトリを取得
CURRENT_DIR=$(dirname "$(readlink -f "$0")")
cd "$CURRENT_DIR"

# 現在のフォルダパスにスペースが含まれていないかチェック
CURRENT_PATH=$(pwd)
if [[ "$CURRENT_PATH" == *" "* ]]; then
    echo "[ERROR] 現在のフォルダパスにスペースが含まれています。\"$CURRENT_PATH\""
    echo "スペースを含まないフォルダパスにファイルを移動して、再実行してください。"
    exit 1
fi

# 既存の仮想環境の削除確認
if [ -d "SdxlWebUi/venv-forge" ]; then
    read -p "更新に時間がかかりますが、安全のために SdxlWebUi/venv-forge/ を削除しますか？ [y/n] " YES_OR_NO
    if [[ "$YES_OR_NO" == "y" || "$YES_OR_NO" == "Y" ]]; then
        rm -rf SdxlWebUi/venv-forge
    fi
else
    echo "必要なパッケージをダウンロードします:"
    echo "https://www.python.org"
    echo "https://github.com/pypa/get-pip"
    echo "https://github.com/git-for-windows"
    echo "https://github.com/aria2/aria2"
    echo "https://github.com/lllyasviel/stable-diffusion-webui-forge"
    echo "その他のリソースもダウンロードします。"
    read -p "よろしいですか? [y/n]" YES_OR_NO

    if [[ "$YES_OR_NO" == "n" || "$YES_OR_NO" == "N" ]]; then
      exit 1
    fi
fi

# 古いディレクトリを削除
if [ -d "./SdxlWebUi/setup/lib/EasySdxlWebUi-main" ]; then
    rm -rf ./SdxlWebUi/setup/lib/EasySdxlWebUi-main
fi

# lib ディレクトリが存在しない場合は作成
mkdir -p SdxlWebUi/setup/lib

# リポジトリのダウンロード
curl -Lo SdxlWebUi/setup/lib/EasySdxlWebUi.zip https://github.com/Zuntan03/EasySdxlWebUi/archive/refs/heads/main.zip

# アーカイブの解凍
unzip SdxlWebUi/setup/lib/EasySdxlWebUi.zip -d SdxlWebUi/setup/lib

# ダウンロードしたアーカイブの削除
rm SdxlWebUi/setup/lib/EasySdxlWebUi.zip

# ファイルの移動
cp -r SdxlWebUi/setup/lib/EasySdxlWebUi-main/. .

# 必要なシェルスクリプトの実行
bash SdxlWebUi/setup/Setup-SdxlWebUi-forge.sh

bash SdxlWebUi/setup/Setup-SdxlWebUi-Resource.sh

# SdxlWebUi-forge.sh をバックグラウンドで実行
nohup bash SdxlWebUi-forge.sh &

echo "Setup completed successfully."
