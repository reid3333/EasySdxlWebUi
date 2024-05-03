#!/bin/bash

# 文字コード設定を日本語 (UTF-8) に設定
export LANG=ja_JP.UTF-8

# Git のパスを設定
source "$(dirname $(realpath "$0") )/SetGitPath.sh"
if [ $? -ne 0 ]; then
    echo "Failed to set Git path"
    exit 1
fi

# リポジトリ URL とディレクトリ名の取得
GIT_CLONE_OR_PULL_URL="$1"
GIT_CLONE_OR_PULL_DIR=$(basename "$GIT_CLONE_OR_PULL_URL" .git)

# リポジトリの存在確認と URL の確認
if [ -d "$GIT_CLONE_OR_PULL_DIR" ]; then
    pushd "$GIT_CLONE_OR_PULL_DIR" > /dev/null
    REMOTE_ORIGIN_URL=$(git config --get remote.origin.url)

    if [ "$GIT_CLONE_OR_PULL_URL" == "$REMOTE_ORIGIN_URL" ]; then
        CHECKOUT_NAME="$2"
        if [ ! -z "$CHECKOUT_NAME" ]; then
            git checkout "$CHECKOUT_NAME"
        fi

        git pull
        if [ $? -ne 0 ]; then
            echo "Failed to pull changes"
            popd > /dev/null
            exit 1
        fi
    else
        popd > /dev/null
        echo "Removing directory due to URL mismatch"
        rm -rf "$GIT_CLONE_OR_PULL_DIR"
        if [ $? -ne 0 ]; then
            echo "Failed to remove directory"
            exit 1
        fi
    fi
    popd > /dev/null
else
    git clone "$GIT_CLONE_OR_PULL_URL"
    if [ $? -ne 0 ]; then
        echo "Failed to clone repository"
        exit 1
    fi
fi
