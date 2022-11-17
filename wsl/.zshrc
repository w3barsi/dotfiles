export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"
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
alias nala="sudo nala"
alias src="source ~/.zshrc"
alias open="wslview"
alias lg="lazygit"
alias ld="lazydocker"
alias winget="winget.exe"
# alias mpv="mpv.exe"
alias yt-dl="cd /mnt/e/Spotify/ && yt-dlp"
alias yt-dld="cd /mnt/e/Spotify/ && yt-dlp -f 'bestaudio[ext=m4a]'"
 
# Vim aliases
alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias nv='/mnt/c/tools/neovide.exe --wsl'
alias avim="nvim -u ~/.config/avim/init.lua"

#RC Aliases
alias zshrc='vim ~/.zshrc'
alias cdcfg='cd ~/dotfiles/arch/ && nvim .'
alias vimrc='cd ~/dotfiles/nvim/.config/nvim && vim '
alias nvimrc='cd ~/dotfiles/nvim/.config/nvim && nv'

alias move='mv'
alias ls='exa'
alias la='ls -la'

# Terminal Apps Shortcut
#alias btm="btm --color gruvbox"
alias catt="bat --theme gruvbox-dark"
alias tb="nc termbin.com 9999"

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





# export PATH=~/dotfiles/scripts:$PATH
# export PATH=$PATH:/home/barsi/dotfiles/scripts/
# source /usr/share/nvm/init-nvm.sh
# export PATH=$PATH:~/.yarn/bin

# source "/home/barsi/.oh-my-zsh/custom/themes/spaceship.zsh-theme"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DISCORD=false

eval "$(zoxide init bash)"

export SUDO_EDITOR="nvim"
export USER_BIN="/home/barsi/bin/"
export PATH="$USER_BIN:$PATH"
export LOCAL_USER_BIN="/home/barsi/.local/bin/"
export PATH="$LOCAL_USER_BIN:$PATH"
export STARSHIP_CONFIG="/home/barsi/.starship.toml"

# fnm
export PATH=/home/barsi/.fnm:$PATH
eval "`fnm env`"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fnm
export PATH=/home/barsi/.fnm:$PATH
eval "`fnm env`"

# Go
export PATH=$PATH:/usr/local/go/bin

eval "$(starship init zsh)"


