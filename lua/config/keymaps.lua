-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local prefix = "<leader>"

-- Basic keymaps outisde of which-key
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("n", prefix .. "s", ":update<CR>", { noremap = false, silent = true, desc = "Save file" })

-- Git keymaps on which-key
vim.keymap.set("n", prefix .. "gs", ":Git<CR>", { desc = "Fugitive", silent = true })
vim.keymap.set("n", prefix .. "gl", ":lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame", silent = true })
vim.keymap.set("n", prefix .. "gp", ":lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk", silent = true })
vim.keymap.set("n", prefix .. "gj", ":lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>", { desc = "Next Hunk", silent = true })
vim.keymap.set("n", prefix .. "gk", ":lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>", { desc = "Prev Hunk", silent = true })
