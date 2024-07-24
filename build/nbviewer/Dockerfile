# ビルダーステージ: Bun を使用してアプリケーションをビルド
FROM oven/bun:1 as builder

WORKDIR /app

# アプリケーションの依存関係をコピーしてインストール
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

# アプリケーションのソースコードをコピーしてビルド
COPY . .
RUN bun run build

# ランナーステージ: Jupyter 環境でアプリケーションを実行
FROM quay.io/jupyter/base-notebook:python-3.9

USER root

# 必要なシステムパッケージをインストール
RUN apt-get update && apt-get install -y \
    fonts-noto-cjk \
    nodejs \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Bun をインストール
RUN npm install -g bun

# ビルダーステージからビルド済みのアプリケーションをコピー
COPY --from=builder /app/dist /home/jovyan/work/app

# 作業ディレクトリを設定
WORKDIR /home/jovyan/work

# ユーザーを jovyan に戻す
USER jovyan

# Jupyter と Bun の両方を起動するスクリプトを作成
COPY <<EOF /home/jovyan/start.sh
#!/bin/bash
jupyter notebook --ip=0.0.0.0 --no-browser &
cd /home/jovyan/work/app && bun start
EOF

RUN chmod +x /home/jovyan/start.sh

# コンテナ起動時のデフォルトコマンド
CMD ["/home/jovyan/start.sh"]

# Jupyter のデフォルトポート 8888 と、アプリケーションのポート（例：3000）を公開
EXPOSE 8888 3000