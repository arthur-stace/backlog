#!/usr/bin/env sh

chsh -s $(which zsh)

eval `ssh-agent -s`

ssh-add .ssh/id_rsa

ssh-keyscan -H github.com >> /root/.ssh/known_hosts

git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm

git clone git://github.com/thoughtbot/dotfiles.git

git clone git@github.com:arthur-stace/dotfiles-local.git

env RCRC=$HOME/dotfiles/rcrc rcup

