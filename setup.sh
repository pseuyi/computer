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
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "updating homebrew"
    brew update
fi

tap "caskroom/cask"

formulas=(
  git
  zsh
  heroku
  # aws
  node
  npm
  yarn
  bundler
  ruby
  rvm
  imagemagick
  postgresql
  redis
  atom
  docker
  rcm
)

# apps=(
#   google-chrome
#   atom
#   vlc
# )

echo "installing formulas . . ."
brew install ${formulas[@]}

# echo "installing applications . . ."
# brew cask install --appdir="/Applications" ${apps[@]}

# env RCRC=$HOME/computer/rcrc rcup

# change to zsh
chsh -s $(which zsh)
