# ベースイメージ
FROM php:latest

# 依存関係のインストール
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libzip-dev \
    strace

# PHP拡張のインストール
RUN docker-php-ext-install pdo pdo_mysql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Xdebugのインストールは最後にするほうが良い、phpが実行できなくてstuckするため
RUN pecl install xdebug && docker-php-ext-enable xdebug
