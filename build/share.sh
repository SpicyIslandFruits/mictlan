#!/bin/bash

# .envファイルからZROK_TOKENを読み込む
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".envファイルが見つかりません。"
    exit 1
fi

# ZROK_TOKENが設定されているか確認
if [ -z "$ZROK_TOKEN" ]; then
    echo "ZROK_TOKENが.envファイルで設定されていません。"
    exit 1
fi

# zrok enableコマンドを実行
zrok enable $ZROK_TOKEN

# zrok reserve public http://localhost:3000

# zrok shareコマンドをバックグラウンドで実行
nohup zrok share reserved b7ra0lmmjhmi --headless &

echo "zrokが正常に起動されました。"