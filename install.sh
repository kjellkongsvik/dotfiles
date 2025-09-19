#!/usr/bin/env bash
export DEST=$HOME
find . -type d -not -path "./.git*" -exec mkdir -p $DEST/{} \;
find . -type f -not -path "./.git/*" -not -path "./install.sh" -exec ln -sf $PWD/'{}' $DEST/'{}' \;

