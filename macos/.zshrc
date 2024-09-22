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
alias ytdl-a="youtube-dl "

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
# alias tatt="tmux attach -t"
alias tnew="tmux new -s"

alias tkill="tmux kill-session -t"
alias tnuke="tmux kill-server"

tatt() {
    if [ -n "$1" ]; then
        tmux attach -t "$1"
    else
        tmux attach
    fi
}

t-rnm() {
    command tmux rename-session -t "$1" "$2"
}

mkcd() {
	command mkdir "$1" && cd "$1"
}

rs() {
    SESSION=$(tmux display-message -p '#S')
    WINDOW=1
    PANE=0
    # Send Ctrl+C to the process in the specified pane
    tmux send-keys -t "$SESSION:$WINDOW.$PANE" C-c
    sleep 1
    tmux send-keys -t "$SESSION:$WINDOW.$PANE" 'clear; pnpm dev' C-m
}

export DISCORD=false

export SUDO_EDITOR="nvim"
export EDITOR="nvim"
export USER_BIN="/home/barsi/bin/"
export BOB="/home/barsi/.local/share/bob/nvim-bin"
export PATH="$BOB:$USER_BIN:$PATH"
export LOCAL_USER_BIN="/home/barsi/.local/bin/"
export PATH="$LOCAL_USER_BIN:$PATH"
export STARSHIP_CONFIG="~/.starship.toml"

# fnm for macos
eval "$(fnm env --use-on-cd --shell zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Go
export PATH=$PATH:/usr/local/go/bin

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"



# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Auto Completes
# - Bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
[ -s "$HOME/.zfunc/_bob" ] && source "$HOME/.zfunc/_bob"
[ -s "$HOME/.zfunc/_pnpm" ] && source "$HOME/.zfunc/_pnpm"

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

# Turso
export PATH="$PATH:/home/barsi/.turso"
# Laravel
export PATH=~/.config/composer/vendor/bin:$PATH

# fnm
FNM_PATH="/home/barsi/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/barsi/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

. "$HOME/.atuin/bin/env"
