#!/bin/bash

# 現在の作業ディレクトリを保存
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

install_apt_packages() {
    echo "APTパッケージのインストールを開始します..."
    sudo apt install -y unzip wget
    echo "APTパッケージのインストールが完了しました。"
}

install_vscode_extensions() {
    echo "VSCode拡張機能のインストールを開始します..."
    EXTENSIONS_FILE="$SCRIPT_DIR/vscode_extensions.txt"
    if [ ! -f "$EXTENSIONS_FILE" ]; then
        echo "エラー: $EXTENSIONS_FILE が見つかりません。"
        return 1
    fi
    while IFS= read -r extension || [[ -n "$extension" ]]; do
        [[ "$extension" =~ ^[[:space:]]*$ || "$extension" =~ ^# ]] && continue
        echo "インストール中: $extension"
        code --install-extension "$extension"
    done < "$EXTENSIONS_FILE"
    echo "VSCode拡張機能のインストールが完了しました。"
}

install_pip_packages() {
    echo "Pipパッケージのインストールを開始します..."
    pip install -r "$SCRIPT_DIR/requirements.txt"
    echo "Pipパッケージのインストールが完了しました。"
}

install_bun() {
    echo "Bunのインストールを開始します..."
    curl -fsSL https://bun.sh/install | bash
    # 親ディレクトリに移動せずに bun install を実行
    if [ -f "$SCRIPT_DIR/../package.json" ]; then
        ~/.bun/bin/bun install --cwd "$SCRIPT_DIR/.."
    else
        echo "警告: 親ディレクトリに package.json が見つかりません。bun install をスキップします。"
    fi
    echo "Bunのインストールが完了しました。"
}

install_go() {
    echo "Goのインストールを開始します..."
    GO_VERSION="1.22.5" # 最新の安定版に適宜更新してください
    GO_INSTALL_DIR="$HOME/sdk/"
    
    mkdir -p "$GO_INSTALL_DIR"
    
    wget "https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz"
    tar -C "$GO_INSTALL_DIR" -xzf "go$GO_VERSION.linux-amd64.tar.gz"
    rm "go$GO_VERSION.linux-amd64.tar.gz"
    
    $GO_INSTALL_DIR/go/bin/go install -n github.com/go-delve/delve/cmd/dlv@latest
    
    echo "Goのインストールが完了しました。"
}

# メイン処理
case "$1" in
    apt)
        install_apt_packages
        ;;
    vscode)
        install_vscode_extensions
        ;;
    pip)
        install_pip_packages
        ;;
    bun)
        install_bun
        ;;
    go)
        install_go
        ;;
    all)
        install_apt_packages
        install_vscode_extensions
        install_pip_packages
        install_bun
        install_go
        ;;
    *)
        echo "使用方法: $0 {apt|vscode|pip|bun|go|all}"
        exit 1
        ;;
esac

exit 0