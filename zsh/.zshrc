# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/zat/.local/bin:$PATH
export PATH=/home/zat/.local/share/gem/ruby/3.0.0/bin:$PATH
export DOTFILES="$HOME/.zy-dots"
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# ZSH_THEME="robbyrussell"

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
