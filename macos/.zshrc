export ZSH="$HOME/.oh-my-zsh"

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

plugins=(
    git
    extract
    zsh-completions
    # zsh-syntax-highlighting
    # zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
 
# =============================================================================
# ========== Alias ============================================================
# =============================================================================
# System Stuff
alias src="source ~/.zshrc"

alias lg="lazygit"
alias ld="lazydocker"
alias python="python3"
 
# Vim aliases
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias p="pnpm"

#RC Aliases
alias dots="~/dotfiles/scripts/edit-dotfiles.sh"
alias arc="cd ~/dotfiles && vim ./wsl/wm.ahk"
alias krc="vim ~/.config/karabiner/karabiner.json"
alias hrc="vim ~/.hammerspoon/"
alias alacrc="vim ~/.config/alacritty/alacritty.yml"
alias zshrc="vim ~/.zshrc"
alias cdcfg="cd ~/dotfiles/arch/ && nvim ."
alias vimrc="cd ~/.config/nvim && nvim ."
alias nvimrc="cd ~/dotfiles/nvim/.config/nvim && nv"

alias move="mv"
alias ls="exa"
alias la="ls -la --group-directories-first"

alias ts="~/dotfiles/scripts/tmux-sessionizer"
alias tls="tmux ls"
alias tatt="tmux attach -t"
alias tnew="tmux new -s"
alias tkill="tmux kill-session -t"

alias ytdl-a="youtube-dl "

t-rnm() {
    command tmux rename-session -t "$1" "$2"
}

mkcd() {
	command mkdir "$1" && cd "$1"
}

export DISCORD=false

export SUDO_EDITOR="nvim"
export USER_BIN="/home/barsi/bin/"
export PATH="$USER_BIN:$PATH"
export LOCAL_USER_BIN="/home/barsi/.local/bin/"
export PATH="$LOCAL_USER_BIN:$PATH"
export STARSHIP_CONFIG="~/.starship.toml"

# fnm for macos
export PATH="$HOME/.fnm:$PATH"
eval "`fnm env`"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Go
export PATH=$PATH:/usr/local/go/bin

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# bun completions
[ -s "/Users/kuya/.bun/_bun" ] && source "/Users/kuya/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# bun completions
[ -s "/Users/barsi/.bun/_bun" ] && source "/Users/barsi/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/barsi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

clear

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^r' atuin-search

# fnm for wsl
export PATH="/home/barsi/.local/share/fnm:$PATH"
eval "`fnm env`"
