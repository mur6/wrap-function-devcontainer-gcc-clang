FROM gcc:latest

WORKDIR /workspace

# Clangのインストールに必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y clang && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
