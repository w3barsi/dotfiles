export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    extract
    #zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
 
# =============================================================================
# ========== Alias ============================================================
# =============================================================================
#School aliases
alias dsa="cd ~/school/DSA/"

# System Stuff
alias src="source ~/.zshrc"

alias lg="lazygit"
alias ld="lazydocker"

alias winget="winget.exe"
 
# Vim aliases
alias v='nvim'
alias vim='nvim'
alias vi='nvim'

#RC Aliases
alias alacrc='vim ~/.config/alacritty/alacritty.yml'
alias zshrc='vim ~/.zshrc'
alias cdcfg='cd ~/dotfiles/arch/ && nvim .'
alias vimrc='cd ~/dotfiles/nvim/.config/nvim && vim '
alias nvimrc='cd ~/dotfiles/nvim/.config/nvim && nv'

alias move='mv'
alias ls='exa'
alias la='ls -la'


alias tls="tmux ls"
alias tatt="tmux attach -t"
alias tnew="tmux new -s"
alias tkill="tmux kill-session -t"


t-rnm() {
    command tmux rename-session -t "$1" "$2"
}

mkcd() {
	command mkdir "$1" && cd "$1"
}

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

runc ()
{
    command gcc $@.c -o $@ && ./$@
}

rmv () {
        command rm -rv $1 | pv -l -s $( du -a $1 | wc -l ) > /dev/null
}

export DISCORD=false

export SUDO_EDITOR="nvim"
export USER_BIN="/home/barsi/bin/"
export PATH="$USER_BIN:$PATH"
export LOCAL_USER_BIN="/home/barsi/.local/bin/"
export PATH="$LOCAL_USER_BIN:$PATH"
export STARSHIP_CONFIG="/Users/kuya/.starship.toml"

# fnm
export PATH="$HOME/.fnm:$PATH"
eval "`fnm env`"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Go
export PATH=$PATH:/usr/local/go/bin

eval "$(starship init zsh)"


