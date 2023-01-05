# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/zat/.local/bin:$PATH
export PATH=/home/zat/.local/share/gem/ruby/3.0.0/bin:$PATH
export DOTFILES="$HOME/.zy-dots"

ZSH_THEME="robbyrussell"

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
alias vim='lvim'
alias zshrc='lvim ~/.zshrc'
alias tmuxconf='lvim ~/.tmux.conf'
alias gitconfig='lvim ~/.gitconfig'
alias j='jump'
alias sf='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs lvim'
alias gfob='git fetch origin && git pull --rebase'
eval "$(starship init zsh)"
# export PATH=$PATH:~/.config/diff-so-fancy
