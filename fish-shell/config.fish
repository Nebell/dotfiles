function fish_git_support
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
end

function fish_prompt

    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)" [$last_status]"(set_color normal)
    end

    if fish_is_root_user
        set_color brred
    else 
        set_color brgreen
    end

    echo -n $USER
    set_color normal
    echo -n "@"
    set_color bryellow
    echo -n "$hostname"
    set_color -i 3CB371
    # set_color -i 2E8B57
    echo -n " "(prompt_pwd)
    set_color normal
    echo -n (fish_git_prompt)
    set_color white
    echo -n "$stat> "
    set_color normal
end

# https://fishshell.com/docs/current/cmds/fish_right_prompt.html
function fish_right_prompt
    date '+%H:%M:%S'
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    fish_git_support

    if command -v any-nix-shell > /dev/null
        any-nix-shell fish --info-right | source
    end
end

set -U fish_greeting

# rust mirrors
set -x RUSTUP_UPDATE_ROOT https://mirrors.cernet.edu.cn/rustup/rustup
set -x RUSTUP_DIST_SERVER https://mirrors.cernet.edu.cn/rustup

set -gx PATH $PATH $HOME/go/bin

# FZF tab completion
# fisher install jethrokuan/fzf
set -U FZF_COMPLETE 0