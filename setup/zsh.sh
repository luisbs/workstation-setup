#!/bin/bash
# Utilidad para instalar zsh y oh-my-zsh

helpFunction()
{
   echo ""
   echo "Usage: setup-zsh.sh -u user -c .zshrc"
   echo -e "\t-u User to setup Zsh as default shell"
   echo -e "\t-c URL of the .zshrc file"
   exit 1
}

while getopts "u:c:" opt
do
   case "$opt" in
      u ) USERNAME="$OPTARG" ;;
      c ) CONFIGURATION="$OPTARG" ;;
      ? ) helpFunction ;; # Imprime informacion de ayuda
   esac
done

INSTALLED = `dpkg --get-selections zsh | sed 's/^zsh[\s\t]*//gi'`
if ! command_exists zsh; then
  echo "Installing Zsh"
  apt install zsh
fi
echo "Zsh installed!"

if [ -n "$USERNAME" ] then
  chsh -s /bin/zsh $USERNAME
  echo "Configured Zsh as default shell for $1"
else
  chsh -s $(which zsh)
  echo "Configured Zsh as default shell"
fi

# Instalacion de Oh My Zsh
mkdir ~/.packages/.oh-my-zsh
ZSH=~/.packages/.oh-my-zsh sh install.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalando configuracion
if [ -n "$CONFIGURATION" ] then
  wget $CONFIGURATION -o ~/.zshrc
else
  wget https://raw.githubusercontent.com/luisbs/workstation-setup/master/settings/.zshrc -o ~/.zshrc
fi
echo "Configured Oh My Zsh"
