TOOLBELT_CFG_FILE="$HOME/.config/configstore/vtex.json"
CUSTOM_VTEX_COLOR="magenta"

parse_vtex_json() {
    cat "$TOOLBELT_CFG_FILE" | grep $1 | sed -n "s/^.*\"$1\": \"\(.*\)\".*$/\1/p"
}

ACCOUNT=`parse_vtex_json "account"`
WORKSPACE=`parse_vtex_json "workspace"`

show_vtex() {
  if [[ -e 'manifest.json' ]]; then
    echo "%{$fg[$CUSTOM_VTEX_COLOR]%}vtex:($ACCOUNT@$WORKSPACE)%{$reset_color%} "
  fi
}

PROMPT='[%*] %{$fg[cyan]%}%n%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) $(show_vtex)%(!.#.$) '
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
