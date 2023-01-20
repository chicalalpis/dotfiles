## language
export LANG=ja_JP.UTF-8

## colors
autoload -Uz colors; colors

## history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

## setopt
setopt auto_cd
setopt complete_in_word
setopt correct
setopt extended_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt auto_pushd
setopt pushd_ignore_dups

## autocomp
autoload -U compinit; compinit
setopt auto_param_slash #ディレクトリ名の補完で末尾にスラッシュ
setopt list_packed # 補完機能を詰めて表示
zstyle ':completion:*' list-colors '' # 補完機能をカラー表示
zstyle ':completion:*:default' menu select=2 # 補完候補をハイライト、上下左右の有効化
zstyle ':completion:*' list-separator '~~>' # セパレータの設定
bindkey "^I" menu-complete   # Ctrl-iで展開前に補完するようにする
# 補完機能がめっちゃ頑張る
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for:'$fg[yellow]' %d'${reset_color}
zstyle ':completion:*:descriptions' format $fg[yellow]'completing %B%d%b'${reset_color}
zstyle ':completion:*:corrections' format $fg[yellow]'%B%d '$fg[red]'(errors: %e)%b'${reset_color}
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' group-name ''

## git
autoload -Uz vcs_info
zstyle ':vsc_info:*' enable git svn
zstyle ':vcs_info:*' formats '%{'${fg[red]}'%}[%s %b] %{'$reset_color'%}'

# path
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source ~/.zsh.alias
