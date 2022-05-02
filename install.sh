#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /$HOME/.zprofile && \
eval "$(/opt/homebrew/bin/brew shellenv)"

# install z
brew install z && \
$(brew --prefix)/etc/profile.d/z.sh

# install fzf
brew install fzf && \
$(brew --prefix)/opt/fzf/install

# zsh
chmod +x ./zsh/setup.sh && \
./zsh/setup.sh
