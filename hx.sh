#!/usr/bin/env bash
wget https://github.com/helix-editor/helix/releases/download/25.07.1/helix-25.07.1-x86_64-linux.tar.xz -O h.tar.xz
tar xf h.tar.xz
rm h.tar.xz
mkdir -p ~/.local/bin
mv helix-25.07.1-x86_64-linux/hx ~/.local/bin
mkdir -p ~/.config/helix
mv helix-25.07.1-x86_64-linux/runtime ~/.config/helix
rm -rf helix-25.07.1-x86_64-linux
