if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export ZSH="/home/barsi/.oh-my-zsh"

# THEME
ZSH_THEME="powerlevel10k/powerlevel10k"

# PLUGIN
plugins=(git
        zsh-autosuggestions
        zsh-syntax-highlighting
        copydir
        copyfile
        copybuffer
	zsh-peco-history
)
source $ZSH/oh-my-zsh.sh

# EXPORTS
export EDITOR='nvim'

# ALIAS
alias rc="~/dotfiles/scripts/edit-dotfiles.sh"
alias zshrc="nvim ~/.zshrc"
alias t-rc="nvim ~/.tmux.conf"
# alias vimrc="cd ~/dotfiles/nvim && nvim ."
vimrc() {
    if [[ $@ == "init" ]]; then
        cd ~/dotfiles/nvim
        command nvim init.vim
    elif [[ $@ == "" ]]; then
        cd ~/dotfiles/nvim
        command nvim .
    else
        cd ~/dotfiles/nvim
        command nvim plugin/$1.vim
    fi
}

alias lsa="exa -a"
alias la="exa -la"
alias lg="lazygit"

# APT SHORTCUTS
alias sai="sudo apt install"
alias saud="sudo apt update"
alias saug="sudo apt upgrade"

# WINDOWS
alias explorer="explorer.exe ."
alias sg="/home/barsi/go/src/github.com/zquestz/s/s !g "
alias npp="notepad++.exe "
alias ezsh="exec zsh"

# TMUX
alias t-ls="tmux ls"
alias t-att="tmux attach -t"
alias t-new="tmux new -s"
alias t-kill="tmux kill-session -t"
t-rnm() {
    command tmux rename-session -t "$1" "$2"
}


mkcd() {
	command mkdir "$1" && cd "$1"
}

source ~/.nvm/nvm.sh
