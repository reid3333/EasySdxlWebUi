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
    REMOTE_ORIGIN_URL=$(git -C ${GIT_CLONE_OR_PULL_DIR} config --get remote.origin.url)

    if [ "$GIT_CLONE_OR_PULL_URL" == "$REMOTE_ORIGIN_URL" ]; then
        CHECKOUT_NAME="$2"
        if [ ! -z "$CHECKOUT_NAME" ]; then
            git -C ${GIT_CLONE_OR_PULL_DIR} checkout -f "$CHECKOUT_NAME"
        fi

        git -C ${GIT_CLONE_OR_PULL_DIR} pull
        if [ $? -ne 0 ]; then
            echo "Failed to pull changes"
            exit 1
        fi
        exit 0
    else
        # TODO: 不要ディレクトリを削除するスクリプトを別途作る
        echo "Renaming directory due to URL mismatch"
        DST_DIR="__obsolute__${GIT_CLONE_OR_PULL_DIR}"
        mv -f ${GIT_CLONE_OR_PULL_DIR} ${DST_DIR}
        if [ $? -ne 0 ]; then
            echo "Failed to rename directory"
            exit 1
        fi
    fi
fi

git clone "$GIT_CLONE_OR_PULL_URL"
if [ $? -ne 0 ]; then
    echo "Failed to clone repository"
    exit 1
fi
