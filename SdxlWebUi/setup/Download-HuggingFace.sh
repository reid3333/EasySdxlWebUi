#!/bin/bash

# スクリプトのディレクトリを取得
script_dir=$(dirname "$(readlink -f "$0")")

# 文字コード設定
export LANG=ja_JP.UTF-8

# ディレクトリの確認と作成
if [ ! -d "${script_dir}/lib" ]; then
    mkdir "${script_dir}/lib"
fi
pushd "${script_dir}/lib" > /dev/null

# 仮想環境をアクティブにする
source "${script_dir}/ActivateVirtualEnvironment.sh"
if [ $? -ne 0 ]; then
    echo "Failed to activate virtual environment"
    popd > /dev/null
    exit 1
fi

# HuggingFaceのPythonライブラリをインストール
pip install -q huggingface_hub
if [ $? -ne 0 ]; then
    echo "Failed to install huggingface_hub"
    popd > /dev/null
    exit 1
fi

# ディレクトリを元に戻す
popd > /dev/null

# Pythonスクリプトを実行
python "${script_dir}/download_huggingface.py" "$@"
if [ $? -ne 0 ]; then
    echo "Failed to run download_huggingface.py"
    exit 1
fi
