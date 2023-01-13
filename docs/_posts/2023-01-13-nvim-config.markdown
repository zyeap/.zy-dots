---
layout: post
title:  "3. Configuring Neovim"
date:   2023-01-06 12:33:32 -0800
categories: jekyll update
---

![vi book]({{ site.baseurl }}/assets/images/Takunomi_Nao-Kiriyama_Vi.png)

[Neovim][nvim-page] is a fork of the vim text editor commonly found on Linux machines that focuses on extensibility and ease of usage/configuration.

If you've never used vim, here are some resources for getting started!
- `vimtutor` (run this command in your terminal for an interactive vim guide)
- Most editors/IDEs have a vim extension
  - [Vim extension for VS code][vscode-vim]
- ThePrimeagen has great videos on vim, neovim, and other programming concepts:
  - [https://www.youtube.com/@ThePrimeagen/videos](https://www.youtube.com/@ThePrimeagen/videos)

---

### Neovim configuration files

By default, neovim comes without any configuration, so all custom settings and plugins can be added by the user. 

To start neovim, use the command `nvim`. To make it easier to call, you can also add an alias like `v="nvim"` or `vim="nvim"`

![default-nvim]({{ site.baseurl }}/assets/images/default-nvim.png)

The default location where neovim config is stored is `~/.config/nvim`.   

Neovim configuration and plugins can be written in lua, unlike vim which only supports vimscript. Neovim can be setup and configured in different ways; there is no right/wrong way to do it.  

Here is how I configure settings and plugins: 
1. Within `~/.config/nvim`, `mkdir lua`
  - the `lua` directory will hold all configs
2. `cd lua; mkdir settings`
  - `settings` will hold all basic configs, like tabs, line numbers, etc.
3. `cd settings; nvim init.lua`
  - `init.lua` will be where we write the actual config.
  - Here are my [settings][settings-gh]:

    ```
    local set = vim.opt

    set.expandtab = true
    set.smarttab = true
    set.shiftwidth = 4
    set.tabstop = 4

    set.hlsearch = true
    set.incsearch = true
    set.ignorecase = true
    set.smartcase = true

    set.splitbelow = true
    set.splitright = true
    set.wrap = true

    set.cursorline = true
    set.number = true
    set.relativenumber = true
    set.fileencoding = 'utf-8'
    set.termguicolors = true
    set.mouse = 'a'

    set.clipboard = 'unnamed'
    ```
4. Now we have the settings file, we need to call it to load it into neovim
  - Go back to `~/.config/nvim`
  - `nvim init.lua`
  - To load the settings, add `require('settings')`

  The file structure should look like this: 
  ```
  .config/nvim
  ├── init.lua
  ├── lua
  │   ├── settings
  │   │   └── init.lua
  ```
To add more configurations, repeat the process of creating a directory under `~/.config/nvim/lua` and writing the configs under there. Then, call the directory from `~/.config/nvim/init.lua`

---

### Plugin Management

Packer can be used to add/configure plugins in neovim.
  - [https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

After installing packer, create the following file:
  - `~/.config/nvim/lua/packer-config/init.lua`
  - Add the following lines of code
  ```
return require'packer'.startup(function()
      use 'wbthomason/packer.nvim'
end)
  ```

To call the packer configuration, add `require('packer-config)` to the top of your `~/.config/nvim/init.lua`

---

### Plugin configuration
Let's install the nvim-tree plugin, which is a file explorer for neovim.
  - [https://github.com/nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
  - Plugins usually have installation and setup instructions, look through the docs/readme for the plugin.
  - For nvim-tree, add the following lines
    ```
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    ```

The `init.lua` file should now look something like this
  ```
return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
end)
  ```

To install the plugin, run `:PackerSync` within neovim.

Now if you run `:NvimTreeToggle`, you will see a file explorer open on the side.

![nvimtree]({{ site.baseurl }}/assets/images/nvimtree.png)

---

### Key mappings

To make `:NvimTreeToggle` easier to call, we can add a custom key mapping.

To start, create `~/.config/nvim/lua/mappings/init.lua`
  - Add the following lines to the top  

  ```
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
  ```
  - This sets the leader, or prefix key, to ' ', which is the spacebar
  - To add the mapping for `:NvimTreeToggle`, add this line
  ```
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
  ```
  - Add `require('mappings')` to `~/.config/nvim/init.lua`
  - Now, to toggle nvim tree, we can press spacebar + "e"


[nvim-page]: https://neovim.io/
[vscode-vim]: https://marketplace.visualstudio.com/items?itemName=vscodevim.vim
[settings-gh]: https://github.com/zyeap/.zy-dots/blob/main/nvim/.config/nvim/lua/settings/init.lua

