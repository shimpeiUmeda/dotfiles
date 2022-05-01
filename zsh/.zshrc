## プロンプトのテーマ設定
autoload -U promptinit; promptinit
prompt pure

## 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 日本語ファイルを表示
setopt print_eight_bit

## 'cd -' で前回いたdirectoryに移動
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

## コマンドのスペルミスをして実行した場合に候補を表示
setopt correct

## ターミナル間でhistoryを共有
setopt share_history

# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

## historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

## 補完機能ON
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    FPATH=~/.zsh/completion:$FPATH

    autoload -Uz compinit
    compinit

    # 補完時のdirectoryの色を青にする
    zstyle ':completion:*' list-colors 'di=34'
fi

## item2の設定
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
source ~/.iterm2_shell_integration.zsh

## lsの色設定
export LSCOLORS=exfxcxdxcxegedabagacad

source <(minikube completion zsh)
source <(kubectl completion zsh)
source $HOME/bin/z/z.sh

## alias
alias coz="code ~/.zshrc"
alias souz="source ~/.zshrc"
alias co="code ."

alias ls="ls -G" # G -> 結果表示時に色を付ける
alias ll="ls -laG"
alias ..="cd .."
alias ....="cd ../.."
alias copy="tr -d '\n' | pbcopy"

alias st="git status"
alias dif="git diff"
alias difc="git diff --cached"
alias ad="git add -A"
alias adp="git add -p"
alias ci="git commit -m"
alias pull="git pull -r --au"
alias push="git push"
