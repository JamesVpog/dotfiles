
export XDG_CONFIG_HOME="$HOME/.config"
export CLICOLOR=1                     
# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS

alias lzg="lazygit"
# Prompt (or install starship)
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
