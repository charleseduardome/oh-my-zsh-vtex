TOOLBELT_CFG_FILE="$HOME/.config/configstore/vtex.json"
CUSTOM_VTEX_COLOR="magenta"

show_vtex_details() {
  if [[ -f 'manifest.json' && -f "$TOOLBELT_CFG_FILE" ]]; then
    local ACCOUNT=$(jq -r '.account // empty' "$TOOLBELT_CFG_FILE" 2>/dev/null)
    local WORKSPACE=$(jq -r '.workspace // empty' "$TOOLBELT_CFG_FILE" 2>/dev/null)

    if [[ -n "$ACCOUNT" && -n "$WORKSPACE" ]]; then
      echo "%{$fg[$CUSTOM_VTEX_COLOR]%}vtex:($ACCOUNT@$WORKSPACE)%{$reset_color%} "
    fi
  fi
}

PROMPT='[%*] %{$fg[cyan]%}%n%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) $(show_vtex_details)%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
