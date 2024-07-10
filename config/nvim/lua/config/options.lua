-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- 行号
opt.relativenumber = true

-- 开启自动换行
opt.wrap = true

-- sign column
opt.signcolumn = "yes"
opt.showmode = false

-- autoformat
vim.g.autoformat = false

-- set filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.pconf" },
  command = "set filetype=ruby",
})

-- fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
