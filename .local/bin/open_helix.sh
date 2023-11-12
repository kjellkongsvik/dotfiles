#!/usr/bin/env bash

fileName=`wl-paste`
absFileName=$(readlink -f $fileName)
pane_id=$(tmux list-panes -s -F "#{pane_id} #{pane_current_command}" | awk '$2 == "hx" { print $1; exit }')
tmux select-pane -t $pane_id
tmux send-keys -t $pane_id Escape
tmux send-keys -t $pane_id ":o $absFileName" Enter
