# Dockerfile
FROM gcc:latest

WORKDIR /workspace

# 基本的な開発ツールをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    make \
    && rm -rf /var/lib/apt/lists/*
