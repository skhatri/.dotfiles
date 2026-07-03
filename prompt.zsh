setopt PROMPT_SUBST

get_time_icon() {
    local hour=$(date +%-H)
    if (( hour >= 6 && hour < 18 )); then
        echo "%B☼%b"
    else
        echo "%B☽%b"
    fi
}

get_git_info() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        local branch=$(git branch --show-current 2>/dev/null)
        if [[ -z "$branch" ]]; then
            branch=$(git rev-parse --short HEAD 2>/dev/null)
        fi
        
        if git diff-index --quiet HEAD -- 2>/dev/null; then
            echo " %F{green}✔%f %K{blue}%F{white} ${branch} %f%k"
        else
            echo " %F{yellow}✗%f %K{blue}%F{white} ${branch} %f%k"
        fi
    fi
}

PROMPT='%F{cyan}%c%f$(get_git_info) [$(get_time_icon) %D{%H:%M:%S}] %F{cyan}❯%f '
