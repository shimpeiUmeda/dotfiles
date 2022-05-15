#ls時のカラー設定
eval `dircolors ~/.colorrc`

# alias
alias ls='ls -F --color=auto' 
alias l='ls -laF --color=auto'
alias ..='cd ..'
alias ....='cd ../..'

alias st='git status'
alias dif='git diff'
alias difc='git diff --cached'
alias ad='git add -A'
alias adp='git add -p'
alias ci='(){git commit -m "$1"}'
alias uncommit='git reset --soft HEAD^'
alias reset='git reset --hard'
alias pull='git pull -r --au'
alias push='git push'

# git alias
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status