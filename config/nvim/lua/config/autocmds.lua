-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

-- https://github.com/ojroques/nvim-osc52#using-nvim-osc52-as-clipboard-provider
local function copy()
  if vim.v.event.operator == "y" and (vim.v.event.regname == "" or vim.v.event.regname == "+") then
    if vim.loop.os_uname().sysname == "Darwin" then
      require("osc52").copy_register("+")
    else
      require("osc52").copy_register("")
    end
  end
end
vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
