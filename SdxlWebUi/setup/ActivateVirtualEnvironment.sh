#!/bin/bash

# UTF-8 文字コードを設定
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# 必要なパッケージがインストールされているか確認
if ! command -v python3 &> /dev/null; then
    echo "エラー: Pythonがインストールされていません。"
    echo "sudo apt update && sudo apt install python3 を実行してください。"
    exit 1
fi

if ! python3 -m pip --version &> /dev/null; then
    echo "エラー: pipがインストールされていません。"
    echo "sudo apt update && sudo apt install python3-pip を実行してください。"
    exit 1
fi

if ! python3 -m venv --help &> /dev/null; then
    echo "エラー: venvがインストールされていません。"
    echo "sudo apt update && sudo apt install python3-venv を実行してください。"
    exit 1
fi

# 仮想環境ディレクトリの設定
VIRTUAL_ENV_DIR=${1:-venv}

# 仮想環境の設定とアクティベーション
if [ ! -d "$VIRTUAL_ENV_DIR" ]; then
    python3 -m venv "$VIRTUAL_ENV_DIR"
fi

source "$VIRTUAL_ENV_DIR/bin/activate"
python -m pip install --upgrade pip

