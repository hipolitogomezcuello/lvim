-- bootstrap lazy.nvim, LazyVim and your plugins
vim.opt.ignorecase = true  -- Always ignore case...
vim.opt.smartcase = true   -- ...unless search includes uppercase
require("config.lazy")
