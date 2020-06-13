# workstation-setup

[ES] Descripción de las herramientas y el entorno de desarrollo ideal (a mi consideración)

### Apps to Install

- Code Editor [VS Code](https://code.visualstudio.com)
- Git Helper [Github Desktop](https://desktop.github.com)

#### VS Code Extensions (Recomended)

- [Auto Close Tag](https://github.com/formulahendry/vscode-auto-close-tag)
- [Auto Rename Tag](https://github.com/formulahendry/vscode-auto-rename-tag)
- [Bracket Pair Colorizer 2](https://github.com/CoenraadS/Bracket-Pair-Colorizer-2)
- [Material Icon Theme](https://github.com/PKief/vscode-material-icon-theme)
- [Material Theme](https://github.com/material-theme/vsc-material-theme)
- [TODO Highlight](https://github.com/wayou/vscode-todo-highlight)

Required to install in wsl-remote too (to be able in it)

- Clock
- [ESLint](https://github.com/Microsoft/vscode-eslint)
- [Format HTML in PHP](https://github.com/RiFi2k/format-html-in-php)
- [Git History](https://github.com/DonJayamanne/gitHistoryVSCode)
- [Go](https://github.com/golang/vscode-go)
- [indent-rainbow](https://github.com/oderwat/vscode-indent-rainbow)
- [REST Client](https://github.com/Huachao/vscode-restclient)

#### Fonts (Recomended)

- [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono)
- [Fira Code](https://github.com/tonsky/FiraCode)

### Windows Setup (linux trought wsl)

- [Active Windows Subsystem](https://winaero.com/blog/enable-wsl-windows-10-fall-creators-update/) and install a distro from Window Store and activate it.
- Install [Remote - WSL](https://github.com/Microsoft/vscode-remote-release) extension on 'VS Code'
- Install VS Code Extensions

### Ubuntu Setup
The not visual software works on wsl too.

- [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [nvim](https://github.com/neovim/neovim)

## Settings File

- VS Code [settings.json](vscode-settings/settings.json)
- Zsh [.zshrc](settings/.zshrc)

## Lenguages Setup

### Go

Install golang package.
```bash
sudo apt install golang
```

Add on `.profile` and `.bashrc`, `.zshrc` or other shell config.
```bash
export GOPATH="$HOME/.go:$HOME/go"
export PATH="$HOME/.go/bin:$HOME/go/bin:$PATH"
```

And append this on `/etc/environment`.
````bash
PATH="...:$HOME/.go/bin:$HOME/go/bin"
GOPATH="$HOME/.go:$HOME/go"
````

Finally append this on the vscode-settings file, and install the `gotools`.
```json
{
  // Go settings
  "go.autocompleteUnimportedPackages": true,
  "go.docsTool": "gogetdoc",
  "go.formatTool": "goreturns",
  "go.toolsGopath": "$HOME/.go",
  "[go]": {
    "editor.tabSize": 4,
    "editor.insertSpaces": false,
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
      "source.organizeImports": true
    }
  }
}
```
