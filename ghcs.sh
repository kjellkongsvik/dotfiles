#!/usr/bin/env bash
./apt.sh
./hx.sh
curl -sSL https://install.python-poetry.org | python3 -
sudo chsh vscode -s $(which fish)

