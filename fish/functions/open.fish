function open
    command xdg-open $argv >/dev/null 2>&1 &
disown
end
