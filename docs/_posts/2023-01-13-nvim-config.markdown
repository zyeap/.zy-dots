---
layout: post
title:  "3. Configuring Neovim"
date:   2023-01-13 12:33:32 -0800
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
- TJ also has neovim/programming videos and is also a core maintainer of neovim!
  - [https://www.youtube.com/@teej_dv/videos](https://www.youtube.com/@teej_dv/videos)
- Great starting configuration: [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

---

### Neovim configuration files

By default, neovim comes without any configuration, so all custom settings and plugins can be added by the user. 

To start neovim, use the command `nvim`. To make it easier to call, you can also add an alias like `v="nvim"` or `vim="nvim"`

![default-nvim]({{ site.baseurl }}/assets/images/default-nvim.png)

The default location where neovim config is stored is `~/.config/nvim`.   

Neovim configuration and plugins can be written in lua, unlike vim which only supports vimscript. Neovim can be setup and configured in different ways; there is no right/wrong way to do it.  

To start, create the following file structure:
  ```
  ~/.config/nvim
  ├── init.lua
  ├── lua
  │   ├── settings
  │   │   └── init.lua
  ```

The entire neovim configuration can be written in the top level init.lua, but I like to have separate directories for configuration.

I place general configurations and keymaping in `settings/init.lua`
```
-- General settings
local set = vim.opt

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
set.undofile = true
```

After writing some configuration, we can load it into Neovim within the top level init.lua.

Add the following line to `~/.config/nvim/init.lua`
```
require("settings")
```

To source the file and reload your config, run `:luafile %` within Neovim

---

### Plugin Management

Packer can be used to add/configure plugins in neovim.
  - [https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

After installing packer, create the following file:
  - `~/.config/nvim/lua/packer-config/init.lua`

Any user specified plugins can be declared here. As an example, here's what I use:

  ```
  -- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require ('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Startup optimization
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'

  -- UI/efficiency related plugins
  use 'Mofiqul/dracula.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua' -- File explorer
  use 'nvim-lualine/lualine.nvim'
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'windwp/nvim-autopairs' -- Autocomplete brackets/parentheses
  use { 'akinsho/bufferline.nvim', tag = "v3.*" }
  use 'mbbill/undotree'
  use 'lewis6991/gitsigns.nvim'
  use 'numToStr/Comment.nvim'

  -- LSP configuration plugins
  use 'neovim/nvim-lspconfig'
  use 'folke/neodev.nvim'
  use 'williamboman/mason.nvim' -- LSP manager
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind.nvim' -- icons
  use 'j-hui/fidget.nvim' -- LSP loading info

  -- Treesitter config plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'

  -- Telescope plugin
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
  ```

After declaring which plugins to use, run `:PackerSync` to install them to your system.

To call packer, add `require('packer-config)` to the top of your `~/.config/nvim/init.lua`

---

### Plugin configuration

Neovim plugins will usually have documentation on the setup/usage process.

For example, nvim-tree is a useful file explorer with great customizability: [https://github.com/nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

File structure for setting up plugins is same as settings:
```
> tree
.
└── nvim
    ├── init.lua
    ├── lua
    │   ├── nvimtree-config
    │   │   └── init.lua
    │   ├── settings
    │   │   └── init.lua
    └── plugin
        └── packer_compiled.lua

```

Example configuration for nvim-tree
```
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local list = {
    { key = "<CR>", action = "tabnew" },
    { key = "v", action = "vsplit" },
    { key = "s", action = "split" },
    { key = "u", action = "dir_up" },
}

require'nvim-tree'.setup {
    view = {
        mappings = {
            list = list
        }
    },
    renderer = {
        icons = {
            symlink_arrow = " > ",
            show = {
                git = false
            }
        }
    }
}
```

---

### Key mappings

Key mappings are convenient ways to run commands in neovim, like `:NvimTreeToggle` and `:PackerSync`

These are the mappings I use within `settings/init.lua`

```
-- Mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- syntax: mode, keybinding, command, options
map('', '<C-h>', '<C-w>h', opts)
map('', '<C-j>', '<C-w>j', opts)
map('', '<C-k>', '<C-w>k', opts)
map('', '<C-l>', '<C-w>l', opts)

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>c', ':bd<CR>', opts)
map('n', '<leader>h', ':noh<CR>', opts)

-- telescope mappings
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', '<leader>s', ':Telescope live_grep<CR>', opts)
map('n', '<leader>gc', ':Telescope git_commits<CR>', opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>', opts)
map('n', '<leader>gs', ':Telescope git_status<CR>', opts)

-- Other plugin mappings
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>ps', ':PackerSync<CR>', opts)
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)
map('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
```


---  

For more details on my setup, please see: [https://github.com/zyeap/.zy-dots/tree/main/nvim/.config/nvim](https://github.com/zyeap/.zy-dots/tree/main/nvim/.config/nvim)

![nvim-config]({{ site.baseurl }}/assets/images/nvim-config.png)



[nvim-page]: https://neovim.io/
[vscode-vim]: https://marketplace.visualstudio.com/items?itemName=vscodevim.vim
[settings-gh]: https://github.com/zyeap/.zy-dots/blob/main/nvim/.config/nvim/lua/settings/init.lua

