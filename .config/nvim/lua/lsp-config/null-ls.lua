local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

-- sources for formatting, must be installed locally
local sources = {
	formatting.black,
	formatting.stylua,
	formatting.yamlfmt,
}

null_ls.setup({
	sources = sources,
})
