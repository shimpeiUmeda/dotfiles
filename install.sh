# /bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \

brew install node && \

# for zsh prompt
npm install -g pure-prompt

# install z
mkdir ~/bin && \
https://github.com/rupa/z.git ~/bin

# git alias
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
