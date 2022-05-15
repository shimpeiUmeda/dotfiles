#!/bin/bash

# mac
if [ $(uname -s) = 'Darwin' ]; then
echo 'install for mac!'

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /$HOME/.zprofile && \
eval "$(/opt/homebrew/bin/brew shellenv)" && \

brew install zsh-completions && \
if type brew &>/dev/null; then
     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

     autoload -Uz compinit
     compinit
fi

brew install pure

brew install zoxide && \
eval "$(zoxide init zsh)"

zinit ice wait'1' lucid && \
zinit light mellbourn/zabb

brew install fzf && \
$(brew --prefix)/opt/fzf/install

# linux
else
echo 'install for linux!'

curl -sS https://webinstall.dev/zoxide | bash && \
eval "$(zoxide init zsh)"

git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && \
$HOME/.fzf/install

fi

chmod +x ./zsh/setup.sh && \
./zsh/setup.sh