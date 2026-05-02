#!/usr/bin/env bash
wget https://github.com/zellij-org/zellij/releases/download/v0.44.1/zellij-no-web-x86_64-unknown-linux-musl.tar.gz -O z.tar.gz
tar xf z.tar.gz
rm z.tar.gz
mkdir -p ~/.local/bin
mv zellij ~/.local/bin
