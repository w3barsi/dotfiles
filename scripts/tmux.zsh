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

dev() {
    CURRENT_WINDOW=$(tmux display-message -p '#I')
    tmux send-keys 'nvim' C-m
    tmux new-window -c "$(pwd)" "pnpm dev"
    tmux new-window -c "$(pwd)" "opencode"
    tmux select-window -t $CURRENT_WINDOW
}

