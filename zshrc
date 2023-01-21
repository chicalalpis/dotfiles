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
setopt auto_param_slash
setopt auto_pushd
setopt complete_in_word
setopt correct
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt list_packed
setopt pushd_ignore_dups
setopt share_history

## autocomp
FPATH=/opt/homebrew/share/zsh-completions:$FPATH
autoload -U compinit; compinit
rm -f ~/.zcompdump; compinit
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*:corrections' format $fg[yellow]'%B%d '$fg[red]'(errors: %e)%b'${reset_color}
zstyle ':completion:*:descriptions' format $fg[yellow]'completing %B%d%b'${reset_color}
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:rm:*' menu false
zstyle ':completion:*:warnings' format 'No matches for:'$fg[yellow]' %d'${reset_color}
zstyle ':completion:messages' format '%d'

# path
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh.alias
