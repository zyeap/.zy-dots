# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/zat/.local/bin:$PATH
export PATH=/home/zat/.local/share/gem/ruby/3.0.0/bin:$PATH
export DOTFILES="$HOME/.zy-dots"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

plugins=(
        git
        colored-man-pages
        jump
        zsh-autosuggestions
        zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

# --------------------------------------
# USER DEFINED ALIASES
alias l="exa -lahF --icons --git"
alias v='nvim'
alias vim='nvim'
alias zshrc='nvim ~/.zshrc'
alias tmuxconf='nvim ~/.tmux.conf'
alias gitconfig='nvim ~/.gitconfig'
alias j='jump'
alias sf='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias gfob='git fetch origin && git pull --rebase'
alias icat="kitty +kitten icat"
alias lg="lazygit"
eval "$(starship init zsh)"
# export PATH=$PATH:~/.config/diff-so-fancy
