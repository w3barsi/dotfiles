if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    # fzf
    git
    extract
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
export FZF_BASE=/home/barsi/.oh-my-zsh/plugins/fz/install
 
# =============================================================================
# ========== Alias ============================================================
# =============================================================================
# System Stuff
alias pacman="sudo pacman" 
alias paruu="paru -S --noconfirm"
alias src="source ~/.zshrc"
 
# Vim aliases
alias v='nvim'
alias vim='nvim'
alias vi='nvim'


#RC Aliases
alias zshrc='vim ~/.zshrc'
alias i3rc='vim ~/.config/i3/config'
alias alacrc='vim ~/.config/alacritty/alacritty.yml'
alias cdcfg='cd ~/dotfiles/arch/ && nvim .'
alias vimrc='vim ~/dotfiles/nvim/.config'
alias time="tty-clock -c -S -C 3"
alias Notes="vim ~/Notes"


alias move='mv'
alias cdc='cd && clear'
alias cdb='cd ..'
alias ls='exa'

alias play='playerctl play'
alias pause='playerctl pause'
alias next='playerctl next'
alias back='playerctl back'


# Terminal Apps Shortcut
alias alsa="alsamixer"
alias btm="btm --color gruvbox"
alias catt="bat --theme gruvbox-dark"
alias mangal="~/go/bin/mangal"
alias tb="nc termbin.com 9999"


alias monset="xrandr --output HDMI-0 --off --output DP-0 --mode 1920x1080 --rate 144 --pos 0x0 --rotate left --output DP-1 --off --output HDMI-1 --off --output DP-2 --mode 2560x1440 --rate 165 --pos 1080x240 --rotate normal --output DP-3 --off"

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



git() {
    if [[ $@ == "go" ]]; then
        command git add . && git commit -m 'auto-commit' && git push
    elif [[ $@ == "open" ]]; then
        command google-chrome-stable https://github.com/barsi-dev 2>/dev/null
    elif [[ $@ == "create" ]]; then
        command ~/dotfiles/scripts/gitcreate
    else
        command git "$@"
    fi
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





# export PATH=~/dotfiles/scripts:$PATH
# export PATH=$PATH:/home/barsi/dotfiles/scripts/
# source /usr/share/nvm/init-nvm.sh
# export PATH=$PATH:~/.yarn/bin

# source "/home/barsi/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ~/.zshrc
#
export SUDO_EDITOR="nvim"

export USER_BIN="/home/barsi/bin/"
export PATH="$USER_BIN:$PATH"

# pnpm
export PNPM_HOME="/home/barsi/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
