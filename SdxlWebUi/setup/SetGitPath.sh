#!/bin/bash

# 文字コード設定を日本語 (UTF-8) に設定
export LANG=ja_JP.UTF-8

# Git のインストール状況を確認
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git..."
    sudo apt-get update && sudo apt-get install -y git
    if [ $? -ne 0 ]; then
        echo "Failed to install Git"
        exit 1
    fi
fi

echo "Git is installed at $(which git)"
