# ビルダーステージ: Bun を使用してアプリケーションをビルド
FROM oven/bun:1 AS builder

WORKDIR /app

# アプリケーションの依存関係をコピーしてインストール
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

# アプリケーションのソースコードをコピーしてビルド
COPY . .
RUN bun run build

# ランナーステージ: Jupyter 環境でアプリケーションを実行
FROM python:latest AS runner

WORKDIR /app

# 必要なシステムパッケージをインストール
RUN apt-get update && apt-get install -y \
    fonts-noto-cjk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install notebook

# ビルダーステージからビルド済みのアプリケーションをコピー
COPY --from=builder /app/out/nbviewer /app/nbviewer

CMD [ "/app/nbviewer --port 4000" ]