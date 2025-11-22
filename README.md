# VTEX Workspace Prompt for Oh My Zsh

A custom **Oh My Zsh** theme that displays the current VTEX IO `workspace` and `account` directly in your terminal prompt—no need to run `vtex whoami` every time.

## 📸 Preview

![screenshot](/images/screenshot.png?raw=true)

## 📦 Requirements

- **VTEX IO CLI** — https://developers.vtex.com/docs/guides/vtex-io-documentation-vtex-io-cli-install  
- **Oh My Zsh** — http://ohmyz.sh/

## 🚀 Installation

1. Copy the theme file into the Oh My Zsh theme directory:

   ```bash
   cp vtex.zsh-theme ~/.oh-my-zsh/themes/vtex.zsh-theme
2. Set the theme in your .zshrc:

   ```bash
   ZSH_THEME="vtex"
3. Set the theme in your .zshrc:

   ```bash
   source ~/.zshrc

## 📝 Notes

- Works on macOS and Linux.

- Automatically displays the workspace and account currently active in the VTEX IO CLI.