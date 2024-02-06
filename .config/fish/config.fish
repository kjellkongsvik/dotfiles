set fish_greeting ""
alias fd=fdfind
alias wanip='dig @resolver4.opendns.com myip.opendns.com +short'
set -x PATH $HOME/.local/bin $HOME/.cargo/bin /snap/bin $HOME/go/bin $HOME/.dotnet/tools $PATH
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x GOPATH $HOME/go
set -x DOTNET_ROOT /usr/share/dotnet
# bass source /etc/profile
pyenv init - | source
