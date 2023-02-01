#-----------------------------------------------------------------------
#
# zsh configuration
#
#-----------------------------------------------------------------------
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

# ディレクトリのエイリアスを作成できるようにする
setopt AUTO_NAME_DIRS

# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完時のdirectoryの色を青にする
zstyle ':completion:*' list-colors 'di=34'

# git stashのステータスを表示
zstyle :prompt:pure:git:stash show yes

#-----------------------------------------------------------------------
#
# install command and zsh plugins
#
#-----------------------------------------------------------------------
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

# Start Znap
source ~/Git/zsh-snap/znap.zsh  

znap prompt sindresorhus/pure
# znap source zsh-users/zsh-autosuggestions
# znap source zsh-users/zsh-syntax-highlighting
# znap source marlonrichert/zsh-autocomplete
# znap source marlonrichert/zsh-edit
# znap source junegunn/fzf

# znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

#-----------------------------------------------------------------------
#
# その他読み込み
#
#-----------------------------------------------------------------------
# alias設定
source $HOME/dotfiles/.alias
source $HOME/dotfiles/.completion

source $HOME/dotfiles/.lecto
