export XDG_CONFIG_HOME="$HOME/.config"
export GOPATH="$HOME/go"
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

# better pathing...
# https://stackoverflow.com/questions/11530090/adding-a-new-entry-to-the-path-variable-in-zsh
typeset -U path
path=(
	"/opt/nvim-linux-x86_64/bin"
	"$GOPATH/bin"
	$path
)
export PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jamesvongphasouk/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jamesvongphasouk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamesvongphasouk/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jamesvongphasouk/google-cloud-sdk/completion.zsh.inc'; fi
