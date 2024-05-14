set -U fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# git support
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_char_stateseparator ""
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch cyan 
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✗"
set -g __fish_git_prompt_char_cleanstate ""
# set -g __fish_git_prompt_char_cleanstate "✓"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate $fish_color_normal 

function fish_prompt
    if test $USER = "root"
        set_color red
    else 
        set_color green
    end
    echo -n $USER
    set_color normal
    echo -n "@"
    set_color yellow
    echo -n "$hostname"
    set_color green
    echo -n " "(prompt_pwd)
    set_color blue
    echo -n (fish_git_prompt)
    set_color white
    echo -n "> "
    set_color normal
end

set -gx PATH $PATH $HOME/go/bin
