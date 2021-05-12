#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

echo "setting up computer . . ."

# add_zshrc() {
#
# }

echo "checking homebrew . . ."
which -s brew
if [[ $? != 0 ]] ; then
    echo "installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "updating homebrew"
    brew update
fi


formulas=(
  #git
  zsh
  node
  npm
  yarn
  ruby
  postgresql
  redis
  docker
  rcm
  ack
  the_silver_searcher
  neovim
  rbenv
)

apps=(
  google-chrome
  firefox
  microsoft-edge
  atom
  vscode
  vlc
  flux
  iterm2
  slack
  insomnia
  tableplus
  postgres
  zoom
  find-any-file
  #1password
)

echo "installing formulas . . ."
brew install ${formulas[@]}

echo "installing applications . . ."
brew install --cask --appdir="/Applications" ${apps[@]}

# set RCRC to computer dir
env RCRC=$HOME/dev/computer/rcrc rcup

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# change to zsh
chsh -s /bin/zsh
# chsh -s $(which zsh)
