---
layout: post
title:  "4. Configuring LSP, treesitter, and more"
date:   2023-01-13 12:35:32 -0800
categories: jekyll update
---

![lua book]({{ site.baseurl }}/assets/images/Rin_Shima_Programming_In_Lua.png)

LSP (Language Server Protocol) is built in to neovim, which allows for auto completion, go to definition, find references, and much more.

To learn more about LSP, see Microsoft's official [LSP overview][msft-lsp-page]

---
### LSP server installation and setup

To begin setting up LSP in neovim, a couple plugins should be installed. These are the plugins I use for LSP:

```
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
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics, code actions, formatting
```

[Nvim-lspconfig][nvim-lsp-gh] is the main plugin used to set up LSP, which handles language server setup and configuration

In order to make use of LSP, we need to install a language server on our machine. 
I work with Python on a daily basis, so [pyright][pyright-gh] is one of the language servers I have installed.

To install pyright globally, you can run `npm install -g pyright`.

Alternatively, the Mason plugin can be used to manage language server installations.

![Mason]({{ site.baseurl }}/assets/images/Mason.png)

Now that we have the language server installed, we can configure it to attach to our neovim client.

The [suggested configuration][lsp-suggested-config] works great, but I have made some changes to better suit my setup.

I make use of [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim), which makes it easier to use LSP integration with Mason's LSP server setup.

Here's my full LSP configuration: [https://github.com/zyeap/.zy-dots/blob/main/nvim/.config/nvim/lua/lsp-config/language-servers.lua](https://github.com/zyeap/.zy-dots/blob/main/nvim/.config/nvim/lua/lsp-config/language-servers.lua)

A lot of it was drawn from [kickstart.nvim](kickstart-gh), which is a great initial configuration for neovim!

After LSP is configured to attach to your neovim client, you can run `:LspInfo` to see LSP information for the current buffer:

![LspInfo]({{ site.baseurl }}/assets/images/LspInfo.png)

---

### Autocompletion

To enable autocompletion, we can configure the nvim-cmp plugin.

The configuration I use is pretty much the default, with added icons from lspkind and borders: [https://github.com/zyeap/.zy-dots/blob/main/nvim/.config/nvim/lua/lsp-config/nvim-cmp.lua](https://github.com/zyeap/.zy-dots/blob/main/nvim/.config/nvim/lua/lsp-config/nvim-cmp.lua)

With autocompletion enabled, we can see the suggestions pop up whenever we start typing:

![nvim-cmp]({{ site.baseurl }}/assets/images/nvim-cmp.png)

---

### Treesitter

[Treesitter][treesitter-gh] allows for better syntax highlighting by parsing through syntax objects on your current buffer's language tree

I use two plugins, nvim-treesitter and nvim-treesitter-refactor:

```
  -- Treesitter config plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'
```

The config I use is pretty simple:

```
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {"python", "rust", "lua", "markdown"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
}
```

Check out the [Treesitter gallery][treesitter-gallery] to see more examples of how treesitter works!


[msft-lsp-page]: https://microsoft.github.io/language-server-protocol/overviews/lsp/overview/
[nvim-lsp-gh]: https://github.com/neovim/nvim-lspconfig
[pyright-gh]: https://github.com/microsoft/pyright
[lsp-suggested-config]: https://github.com/neovim/nvim-lspconfig#suggested-configuration
[kickstart-gh]: https://github.com/nvim-lua/kickstart.nvim
[treesitter-gh]: https://github.com/nvim-treesitter/nvim-treesitter
[treesitter-gallery]: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Gallery

