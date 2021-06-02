#!/usr/bin/env bash
fd -t d -H -E .git -x mkdir -p $HOME/{}
fd -t f -H -E .git -E make-links.sh -E .make-links.sh.swp -x ln -s  $PWD/'{}' $HOME/'{}'
