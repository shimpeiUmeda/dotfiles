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

# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完時のdirectoryの色を青にする
zstyle ':completion:*' list-colors 'di=34'

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

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit
# znap source junegunn/fzf

znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx

znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
compdef       _pipenv pipenv

#-----------------------------------------------------------------------
#
# その他読み込み
#
#-----------------------------------------------------------------------
# alias設定
source $HOME/dotfiles/.alias

# ardito
source $HOME/dotfiles/zsh/.ardito 