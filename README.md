# Customização VTEX IO para terminal ZSH

Essa documentação só funcionará para o terminal ZSH com oh-my-zsh instalado.

Para ver a documentação oficial do oh-my-zsh acesse: https://ohmyz.sh/#install.

### Install oh-my-zsh via curl

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Install oh-my-zsh via wget

`sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"`

Após a instalação, será criado um arquivo chamado `.zshrc.pre-oh-my-zsh` com suas antigas configuração, isso acontece devido a criação de um novo arquivo `.zshrc` com as configurações do `oh-my-zsh`, como temas e plugins.

No meu caso, tenho instalado o NVM para gerencias versão do Node localmente, preciso copiar essas configurações para o arquivo `user/oh-my-zsh/oh-my-zsh.sh` que agora é responsável por gerenciar plugins para o meu terminal, não mais `.zshrc`.

### Trecho copiado para o final do arquivo `user/oh-my-zsh/oh-my-zsh.sh` (opcional)

````export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion```

````

Sempre gosto de conferir se os comandos utilizados anteriormente continuam funcionando executando como teste `node -v`, `git -v`, ou `yarn -v`, assim garando que deu tudo certo, assim espeto... ˆˆ

Com o oh-my-zsh instalado vamos criar nosso tema:

1 - acesse a pasta `.oh-my-zsh/themes`;

2 - Crie um arquivo chamado `vtex.zsh-theme` e cole o seguinte código;

```
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
```

3 - Volte para a pasta raiz do seu usuário e abra o arquivo `oh-my-zsh`;

4 - Encontre o trecho que seta o tema e altere para `ZSH_THEME="vtex"`;

5 - Reinicie seu terminal, agora quando vc entrar em alguma pasta que seja um projeto VTEX IO, deve aparecer a account e workspace que vc está trabalhando.
