-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local discipline = require("hipolito.discipline")
-- discipline.cowboy()

local set = vim.keymap.set

-- Tmux
set("n", "<leader>ts", function()
  vim.cmd("!tmux split-window -c " .. vim.fn.expand("%:p:h"))
end, { noremap = true, silent = true })

-- Suggestions (not working)
set({ "i", "c" }, "<M-CR>", "<C-e><CR>", { noremap = true, silent = true })
