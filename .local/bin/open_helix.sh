#!/usr/bin/env bash

file_name=`wl-paste`
abs_file_name=$(readlink -f $file_name)
window_index=$(tmux display-message -p '#{window_index}')
pane_id=$(tmux list-panes -t $window_index -F "#{pane_id} #{pane_current_command}" | awk '$2 == "hx" { print $1; exit }')
tmux select-pane -t $pane_id
tmux send-keys -t $pane_id Escape
tmux send-keys -t $pane_id ":o "$abs_file_name
tmux send-keys -t $pane_id Enter
