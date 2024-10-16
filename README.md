# wrap function

c言語、Linux環境(Docker)、gccとclangでリンカーのwrapオプションをテストするサンプルコード.

## キーワード

- c lang
- gcc
- clang
- リンカー, GNU ld
- wrapオプション
- vscode, docker, docker-compose

## 環境の構築

```bash
docker-compose up -d --build
```

## コンテナへの接続

```bash
docker-compose exec gcc-clang-dev bash
```

## ビルドと動作確認

```bash
bash build.sh
```
