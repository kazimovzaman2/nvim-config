-- Load lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Load all plugin configurations
require("lazy").setup({
    { import = "plugins.treesitter" },
    { import = "plugins.lualine" },
    { import = "plugins.telescope" },
    { import = "plugins.cmp" },
    { import = "plugins.lspconfig" },
    { import = "plugins.colorscheme" },
    { import = "plugins.conform" },
})
