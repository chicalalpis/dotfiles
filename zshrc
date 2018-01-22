## language
export LANG=ja.UTF-8

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

## git
autoload -Uz vcs_info
zstyle 'vsc_info:*' enable git svn
zstyle 'vsc_info:*' formats '%'${fg[red]}'%}[%s %b] %{'reset_color'%}'

## prompt
precmd() { vcs_info }
setopt re_match_pcre
setopt prompt_subst # promptの複数行を許可
PROMPT="
[%* @%m] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[cyan]%})%(?!｜_・%) <!｜_＜%) <)%{${reset_color}%} "
PROMPT2='[%n]> '
SPROMPT="%{$fg[red]%}%{$suggest%}｜д･%%) < %B%r%b %{$fg[red]%}? [ynae]:${reset_color} "
RPROMPT=" ${vcs_info_msg_0_}"

source ./.zsh.alias
source ./.zshfunc
