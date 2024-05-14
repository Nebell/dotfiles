set -U fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
