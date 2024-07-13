#!/bin/bash
export LANG=ja_JP.UTF-8

# パラメータを取得
LINK_DST="$1"
LINK_DST_DIR=$(dirname "$LINK_DST")
LINK_DST_NAME=$(basename "$LINK_DST")
LINK_SRC="$2"

echo "$LINK_SRC $LINK_DST"

# LINK_DSTがシンボリックリンクであれば何もせずに終了
if [ -L "$LINK_DST" ]; then
    exit 0
fi

# LINK_DSTが存在し、リンクではない場合、名前を変更して保護
NEW_NAME="$LINK_DST_NAME"
while [ -e "$LINK_DST_DIR/$NEW_NAME" ]; do
    NEW_NAME="${NEW_NAME}_"
done

if [ -e "$LINK_DST" ]; then
    mv "$LINK_DST" "$LINK_DST_DIR/$NEW_NAME"
    if [ $? -ne 0 ]; then
        read -p "続けるにはエンターキーを押してください"
        exit $?
    fi
fi

# シンボリックリンクを作成
echo "ln -s \"$LINK_SRC\" \"$LINK_DST\""
ln -s "$LINK_SRC" "$LINK_DST"
if [ $? -ne 0 ]; then
    read -p "続けるにはエンターキーを押してください"
    exit $?
fi
