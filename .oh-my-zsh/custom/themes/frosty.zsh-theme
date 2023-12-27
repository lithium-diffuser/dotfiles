#!/usr/bin/env zsh

local black=$fg[black]
local red=$fg[red]
local blue=$fg[blue]
local green=$fg[green]
local yellow=$fg[yellow]
local magenta=$fg[magenta]
local cyan=$fg[cyan]
local white=$fg[white]

local black_bold=$fg_bold[black]
local red_bold=$fg_bold[red]
local blue_bold=$fg_bold[blue]
local green_bold=$fg_bold[green]
local yellow_bold=$fg_bold[yellow]
local magenta_bold=$fg_bold[magenta]
local cyan_bold=$fg_bold[cyan]
local white_bold=$fg_bold[white]

local pchar="ƒ☾𝑥☽"

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="%{$magenta%}%{$blue%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$cyan_bold%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$magenta_bold%}✘ "

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED="%{$green_bold%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$magenta_bold%}≅"
ZSH_THEME_GIT_PROMPT_DELETED="%{$red_bold%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$blue_bold%}≪"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$cyan_bold%}≠"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$yellow_bold%}∅"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD="%{$white_bold%}𝝀"

# display machine name and change color for root status
function get_name {
    local name="%m"
    if [[ "$USER" == 'root' ]]; then
        name="%{$red_bold%}$name%{$red_bold%}%{$reset_color%}"
    else
        name="%{$white_bold%}$name%{$white_bold%}%{$reset_color%}"
    fi
    echo $name
}

# show current working dir starting from $PWD
function get_dir {
    echo "%3~"
}

# assign indicators to the different status of branch
function get_git_prompt {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local git_status="$(git_prompt_status)"
        if [[ -n $git_status ]]; then
            git_status="☾$git_status%{$reset_color%}☽"
        fi
        local git_prompt=" $(git_prompt_info)$git_status"
        echo $git_prompt
    fi
}

# prompt head  ☾machine name☽☾current dir☽ (branch) git status
function print_prompt_head {
    local left_prompt="☾$(get_name)☽%{$cyan%}☾$(get_dir)☽\
$(get_git_prompt)\
%{$reset_color%}"
    print -rP "$left_prompt"
}

# change prompt color based on user lever
function get_prompt_indicator {
    if [[ $? -eq 0 ]]; then
        echo "%{$magenta_bold%}$pchar %{$reset_color%}"
    else
        echo "%{$red_bold%}$pchar %{$reset_color%}"
    fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd print_prompt_head
setopt prompt_subst

PROMPT='$(get_prompt_indicator)'