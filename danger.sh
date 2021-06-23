#!/usr/bin/env bash
fdfind -t d -H -E .git -x mkdir -p $HOME/{}
fdfind -t f -H -E .git -E danger.sh -E .danger.sh.swp -x ln -sf  $PWD/'{}' $HOME/'{}'

