function fish_prompt
    if test $CODESPACES
        printf '@cs '
    else if test $SSH_TTY
        printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    end
    if test "$USER" = root
        echo (set_color red)'$ '
    end

    echo -n (set_color cyan)(prompt_pwd)(set_color white)'$ '
end
