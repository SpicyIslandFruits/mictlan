#!/bin/bash

# スクリプトのディレクトリを取得
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# プロジェクトのルートディレクトリ（このスクリプトの2階層上）
PROJECT_ROOT="$SCRIPT_DIR/../.."

# ソースファイルと出力ファイルのパス
SOURCE_FILE="$PROJECT_ROOT/cmd/bundemo/index.ts"
OUTPUT_FILE="$PROJECT_ROOT/out/bundemo/app"

# ビルドコマンドを実行
bun build --compile --minify --sourcemap "$SOURCE_FILE" --outfile "$OUTPUT_FILE"

# ビルド結果を表示
if [ $? -eq 0 ]; then
    echo "Build successful. Output file: $OUTPUT_FILE"
else
    echo "Build failed."
fi
