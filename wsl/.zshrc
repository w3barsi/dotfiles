# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

# add zsh plugins 
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# load plugins
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh keybinds
# bindkey "^[0A" history-search-backward
# bindkey "^[0B" history-search-forward
bindkey "$key[Up]" history-search-backward
bindkey "$key[Down]" history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# paths
export LOCAL_USER_BIN="/home/barsi/.local/bin/"
export PATH="$LOCAL_USER_BIN:$PATH"

# aliases
alias ls="exa"
alias la="exa -la --group-directories-first"
alias src="source ~/.zshrc"
# - application aliases
alias lg="lazygit"
alias ld="lazydocker"
alias python="python3"
alias p="pnpm"
# - vim aliases
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
# - tmux
source "$HOME/dotfiles/scripts/tmux.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="/home/barsi/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/barsi/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="/Users/barsi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Turso
export PATH="$PATH:/home/barsi/.turso"

# Bob - nvim version manager
export BOB="/home/barsi/.local/share/bob/nvim-bin"
export PATH="$BOB:$USER_BIN:$PATH"

# Golang
export PATH=$PATH:/usr/local/go/bin

# Completions Setup
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
[ -s "$HOME/.zfunc/_bob" ]  && source "$HOME/.zfunc/_bob"
# bob complete zsh > ~/.zfunc/_bob
[ -s "$HOME/.zfunc/_pnpm" ] && source "$HOME/.zfunc/_pnpm"
# pnpm completion zsh > ~/.zfunc/_pnpm
[ -s "$HOME/.zfunc/_fnm" ] && source "$HOME/.zfunc/_fnm"
# fnm completions --shell zsh > $HOME/.zfunc/_fnm
