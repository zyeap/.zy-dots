export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
export PATH=$PATH:~/.config/diff-so-fancy
PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

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
alias l="exa -lahF"
alias v='nvim'
alias vim='nvim'
alias zshrc='nvim ~/.zshrc'
alias tmuxconf='nvim ~/.tmux.conf'
alias gitconfig='nvim ~/.gitconfig'
alias j='jump'
alias fd='fdfind'
alias sf='fdfind --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias gfob='git fetch origin && git pull --rebase'
alias icat="kitty +kitten icat"
alias lg="lazygit"
eval "$(starship init zsh)"

# --------------------------------------
# USER DEFINED FUNCTIONS
gpush () {
        git add -A && git commit -m $1 && git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

gccrun () {
        gcc -Wall -g $1 -o main && ./main "${@:2}"
}
