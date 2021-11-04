#!/usr/bin/env bash

file_list=""
for i in $(find ~/dotfiles/* -type f -print)
do
    file_list+="$i "
done

file_list_new=`echo "$file_list" | tr ' ' '\n'`
selected=`printf "$file_list_new" | fzf`

if [[ $selected == "" ]]; then
    echo 'No file selected'
else
    tmux neww -n 'dotfiles' "cd ~/dotfiles && nvim $selected"
fi

