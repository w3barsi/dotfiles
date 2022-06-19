# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# I you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="spaceship"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # fzf
    git
    extract
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# =============================================================================
# ========== FZF ==============================================================
# =============================================================================
# Set fzf installation directory path
export FZF_BASE=/home/barsi/.oh-my-zsh/plugins/fz/install

# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"


# =============================================================================

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# ALIAS
 
# System Stuff
alias pacman="sudo pacman" 
alias src="source ~/.zshrc"
 
# Vim aliases
alias v='nvim'
alias vim='nvim'
alias vi='nvim'

alias nnpm="npm"
alias npm="pnpm"

#RC Aliases
alias zshrc='vim ~/.zshrc'
alias i3rc='vim ~/.config/i3/config'
alias alacrc='vim ~/.config/alacritty/alacritty.yml'
alias cdcfg='cd ~/dotfiles/arch/ && nvim .'
alias vimrc='vim ~/dotfiles/nvim/.config'



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


alias monset="xrandr --output HDMI-0 --off --output DP-0 --mode 1920x1080 --rate 144 --pos 0x0 --rotate left --output DP-1 --off --output HDMI-1 --off --output DP-2 --mode 2560x1440 --rate 165 --pos 1080x240 --rotate normal --output DP-3 --off"

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



# pnpm
export PNPM_HOME="/home/barsi/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
