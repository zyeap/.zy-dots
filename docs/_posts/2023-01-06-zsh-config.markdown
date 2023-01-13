---
layout: post
title:  "2. Configuring Zsh"
date:   2023-01-06 12:33:32 -0800
categories: jekyll update
---

![Linux command line book]({{ site.baseurl }}/assets/images/Isana_Higashira_Holding_The_Linux_Command_Line.png)

Now that the terminal is setup, let's configure Zsh!

Configuration/Plugin manager for Zsh: [oh-my-zsh][omz-page]
- Installation: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

---

### Useful Plugins
- jump (included with oh-my-zsh by default)
  - used for easy navigation between directories
  - `mark` to add a directory to the jump list
  - `jump <mark name>` to cd into the directory from anywhere
- [zsh-autosuggestions][omz-autosugg]
  - autosuggestions based on history
- [zsh-syntax-highlighting][omz-synhighlight]
  - syntax highlighting for valid/invalid commands

  ![Zsh plugins]({{ site.baseurl }}/assets/images/zsh.png)

After a plugin is installed, add it to the plugin list in your `~/.zshrc`
```
plugins=(
        git
        colored-man-pages
        jump
        zsh-autosuggestions
        zsh-syntax-highlighting
    )
```

---

### Useful Aliases

Aliases are an easy way to use long/hard to remember commands.  
Think of them like nicknames for commands!

To use an alias, add it to your `~/.zshrc` file  

For example, we can shorten the `jump` command to `j` with the following alias:  
```
alias j='jump'
```

Another alias I use pretty frequently is to do a fetch origin and pull from a remote git repo:  
```
alias gfob='git fetch origin && git pull --rebase'
```  

---

### Listing files

`ls` is one of the commands I use the most when working in the terminal:
  ![default ls]({{ site.baseurl }}/assets/images/default-ls.png)

The default `ls` works well, but can be made better.  
- [Exa][exa-site] enhances `ls` by adding integrations for colorized output, symlinks, git, and more!  
- Installation: `pacman -S exa`  
- I use this alias to quickly list files: `alias l="exa -lahF --icons --git"`

![exa]({{ site.baseurl }}/assets/images/exa.png)  

---

### Searching for files

Another issue I run into sometimes is searching for specific files within a project directory  

A couple tools help solve this issue: 
- `fd` - [https://github.com/sharkdp/fd](https://github.com/sharkdp/fd)
- `fzf` - [https://github.com/junegunn/fzf](https://github.com/junegunn/fzf)
- [Vim][vim-site]
- Installation: `pacman -S fd fzf vim`

```
alias sf='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs vim'
```

We use fd to interactively find all files within our current working directory, then pipe the output into fzf-tmux to create a popup fuzzy finder.  

Piping the output into `xargs vim` allows us to open the file we select.

![sf]({{ site.baseurl }}/assets/images/find_files.png)

[omz-page]: https://ohmyz.sh/
[omz-autosugg]: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
[omz-synhighlight]: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
[exa-site]: https://the.exa.website/
[vim-site]: https://www.vim.org/
