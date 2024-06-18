function oo
    switch (uname)
        case Linux
            alias paste wl-paste
        case Darwin
            alias paste pbpaste
    end

    set p = 0
    if test -n "$argv"
        set p = $argv
    end

    tmux select-pane -t$p
    tmux send -t$p Escape
    tmux send -t$p ":o " (paste) Enter
end
