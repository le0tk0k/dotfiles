# Zinit
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GOBIN="$GOPATH/bin"

# cargo
source "$HOME/.cargo/env"

# starship
eval "$(starship init zsh)"

# alias
if [[ $(command -v exa) ]]; then
  alias ls='exa'
  alias la='exa -a'
  alias ll='exa -al'
  alias lt='exa -T'
  alias ltd='exa -T -D'
else
  alias la='ls -a'
  alias ll='ls -al'
fi
if [[ $(command -v bat) ]]; then
  alias cat='bat --theme=Nord'
fi
alias ..='cd ..'
alias ...='cd ../..'
alias push='git add . && git commit -m "update" && git push'

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# completion
autoload -Uz compinit && compinit

# history
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space

# fzf
__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh
