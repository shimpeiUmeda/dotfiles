#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /$HOME/.zprofile && \
eval "$(/opt/homebrew/bin/brew shellenv)"

# zsh
chmod +x ./zsh/setup.sh && \
./zsh/setup.sh

# install z
mkdir ~/bin && \
git clone https://github.com/rupa/z.git ~/bin/z

# install fzf
brew install fzf && \
$(brew --prefix)/opt/fzf/install

# git alias
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
