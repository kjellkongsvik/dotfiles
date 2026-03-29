set fish_greeting ""
set -x EDITOR $HOME/.cargo/bin/hx
set -x PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/.dotnet/tools $PATH
if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
    bind \ch "thu hx;"
    bind \ck "thu copy;"
end
