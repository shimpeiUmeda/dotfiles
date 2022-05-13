# プロンプトのテーマ設定
autoload -U promptinit; promptinit
prompt pure

# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 日本語ファイルを表示
setopt print_eight_bit

# 'cd -' で前回いたdirectoryに移動
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# コマンドのスペルミスをして実行した場合に候補を表示
setopt correct

# ターミナル間でhistoryを共有
setopt share_history

# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完機能ON
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    FPATH=~/.zsh/completion:$FPATH
    source $(brew --prefix)/etc/profile.d/z.sh

    autoload -Uz compinit
    compinit

    # 補完時のdirectoryの色を青にする
    zstyle ':completion:*' list-colors 'di=34'
fi
source <(minikube completion zsh)
source <(kubectl completion zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias
alias cdz='cd $HOME/dotfiles'
alias coz='code ~/.zshrc'
alias sz='source ~/.zshrc'
alias co='code .'

export LSCOLORS=exfxcxdxcxegedabagacad # lsの色設定
alias ls='ls -G' # G -> 結果表示時に色を付ける
alias l='ls -laG'
alias ..='cd ..'
alias ....='cd ../..'
alias c='tr -d "\n" | pbcopy'

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

# item2の設定
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
source ~/.iterm2_shell_integration.zsh

# ardito
source $HOME/dotfiles/zsh/.ardito 