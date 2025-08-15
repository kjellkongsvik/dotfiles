set fish_greeting ""
set -x PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/.dotnet/tools $PATH
uv generate-shell-completion fish | source
