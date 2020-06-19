#!/usr/bin/env sh

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


# Applications
brew tap browsh-org/homebrew-browsh
brew install browsh

brew cask install docker
brew cask install firefox
brew cask install tor-browser
brew cask install electrum
brew cask install ableton-live


# Languages
brew install jq
brew install yq
brew install python
brew install python3
brew install node


# Tools
brew install rcm
brew install tldr
brew install zsh
brew install git
brew install vim
brew install nmap
brew install pass
brew install plantuml
brew install w3m
brew install todoman
brew install bats


# Services
brew install calcurse
brew install tmux
brew install tmuxinator
brew install nginx

# misc

brew install reattach-to-user-namespace
