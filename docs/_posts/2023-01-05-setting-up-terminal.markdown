---
layout: post
title:  "Setting up the terminal"
date:   2023-01-05 12:33:32 -0800
categories: jekyll update
---

### Package Management
To begin setting up the terminal and related configuration, you should be familiar with your system's package manager.

On Arch Linux, [pacman][pacman-arch] is used to manage package installations.

For other Unix/Linux operating systems, you may need to install a package manager. On macOS, [homebrew][homebrew] can be used.

### Terminal Emulator Setup
Terminal emulator: [Kitty][kitty-docs]  
- Installation: `pacman -S kitty`

### Shell installation
Shell: [Zsh][zsh-install]  
- Installation: `pacman -S zsh`  
- Setting as default shell: `chsh -s $(which zsh)`  
- Zsh's default configuration file is located at `~/.zshrc`  

Configuration/Plugin manager: [oh-my-zsh][omz-page]
- Installation: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

#### Useful Plugins
- jump (included with oh-my-zsh by default)
  - used for easy navigation between directories
  - `mark` to add a directory to the jump list
  - `jump <mark name>` to cd into the directory from anywhere
- [zsh-autosuggestions][omz-autosugg]
- [zsh-syntax-highlighting][omz-synhighlight]

  ![Zsh plugins](/assets/images/zsh.png)

### Configuring the Terminal
Kitty's default configuration file is located at `~/.config/kitty/kitty.conf`

Here is a simple [config][personal-kitty-conf] that I use:  
```
cursor_blink_interval 0 
enable_audio_bell no
hide_window_decorations yes

font_family     SauceCodePro NF
font_size       13.0

include dracula.conf
```
Colorscheme: [Dracula][dracula-kitty]  
Font: [Source Code Pro Nerd Font][saucecodepro-nf]

### Terminal prompt

WIP

  ![Kitty terminal](/assets/images/kitty-terminal.png)


[pacman-arch]: https://wiki.archlinux.org/title/pacman
[homebrew]: https://brew.sh
[zsh-install]: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
[omz-page]: https://ohmyz.sh/
[omz-autosugg]: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
[omz-synhighlight]: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
[kitty-docs]: https://sw.kovidgoyal.net/kitty
[kitty-config-docs]: https://sw.kovidgoyal.net/kitty/conf/
[personal-kitty-conf]: https://github.com/zyeap/.zy-dots/blob/main/kitty/.config/kitty/kitty.conf
[dracula-kitty]: https://draculatheme.com/kitty
[saucecodepro-nf]: https://www.nerdfonts.com/font-downloads#:~:text=%E2%80%A2-,Reserved,-Font%20Name%3A%20Source
