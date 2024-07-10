-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- disable keymaps
keymap.del("n", "<S-l>")
keymap.del("n", "<S-h>")

--buffer
keymap.set("n", "<tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<S-tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Goto window
-- keymap.set("n", "wh", "<C-w>h")
-- keymap.set("n", "wk", "<C-w>k")
-- keymap.set("n", "wj", "<C-w>j")
-- keymap.set("n", "wl", "<C-w>l")

-- Page move
keymap.set("n", "tk", "<C-b>")
keymap.set("n", "tj", "<C-f>")

-- vim.keymap.set("v", "<leader>cc", require("osc52").copy_visual)
