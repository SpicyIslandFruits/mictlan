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
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Xdebugのインストール
RUN pecl install xdebug && docker-php-ext-enable xdebug