0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
source "${0:A:h}/fzf-tab.zsh"

# fzf-tab settings
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' fzf-bindings-default 'tab:down,btab:up,change:top,ctrl-space:toggle'
zstyle ':fzf-tab:*' default-color $'\033[38m'
zstyle ':fzf-tab:*' fzf-pad 4

bindkey '^j' fzf-tab-complete
bindkey '^k' fzf-tab-complete

zstyle ':fzf-tab:complete:systemctl-*:*' fzf-flags "--preview-window=right:nohidden:wrap"
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:cd:*' fzf-flags "--preview-window=right:nohidden:nowrap"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -hN --color=always --group-directories-first $realpath' # remember to use single quote here!!!

zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-flags "--preview-window=right:nohidden:wrap"
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
