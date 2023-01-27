TOOLBELT_CFG_FILE="$HOME/.config/configstore/vtex.json"

parse_vtex_json() {
    cat "$TOOLBELT_CFG_FILE" | grep $1 | sed -n "s/^.*\"$1\": \"\(.*\)\".*$/\1/p"
}

get_vtex_account() {
    parse_vtex_json "account"
}

get_vtex_workspace() {
    parse_vtex_json "workspace"
}

show_vtex() {
  if [[ -e 'manifest.json' ]]; then
    echo "%{$fg[magenta]%}vtex:($(get_vtex_account)@$(get_vtex_workspace))%{$reset_color%} "
  fi
}

PROMPT='[%*] %{$fg[cyan]%}%n%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) $(show_vtex)%(!.#.$) '
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
