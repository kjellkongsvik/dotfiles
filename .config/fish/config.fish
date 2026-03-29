set fish_greeting ""
set -x EDITOR $HOME/.cargo/bin/hx
set -x PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/.dotnet/tools $PATH
if status is-interactive
    bind \ch thumbs_helix
    bind \ck "zellij ac dump-screen | thumbs -u | wl-copy"
end
