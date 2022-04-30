## プロンプトのテーマ設定
autoload -U promptinit; promptinit
prompt pure

## 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 日本語ファイルを表示
setopt print_eight_bit

## 'cd -' で前回いたdirectoryに移動
setopt auto_pushd

## コマンドのスペルミスをして実行した場合に候補を表示
setopt correct

## ターミナル間でhistoryを共有
setopt share_history

## historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

## 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups

## 補完機能ON
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    FPATH=~/.zsh/completion:$FPATH

    autoload -Uz compinit
    compinit
fi

source <(minikube completion zsh)
source <(kubectl completion zsh)
source $HOME/bin/z/z.sh

## alias
alias ll="ls -la"
alias ..="cd .."
alias ....="cd ../.."

alias coz="code ~/.zshrc"
alias souz="source ~/.zshrc"
alias co="code ."

alias st="git status"
alias dif="git diff"
alias ad="git add -A"
alias adp="git add -p"
alias ci="git commit -m"
alias pull="git pull -r --au"
