require("theprimeagen")

-- map leader to spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- <leader>pv to show directory tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- hide search highlight
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- show partial commands in the status line
vim.opt.showcmd = true
-- if true, saves file when changing buffer and other commands
vim.opt.autowrite = false --default
-- highlight cursor line
vim.opt.cursorline = true
-- automatically detect external file changes and reload the file
vim.opt.autoread = true

-- 1 tab == 4 spaces
vim.opt.tabstop = 2
-- how much indent when using shift commands (>> and <<)
vim.opt.shiftwidth = 2
-- controls whether indentation is rounded to the nearest multiple
-- of shiftwidth when using shift commands (>> and <<)
vim.opt.shiftround = true

-- buffer resize
vim.keymap.set("n", "<leader><left>", ":vertical resize +5<cr>", { desc = "Vertical resize +5" })
vim.keymap.set("n", "<leader><right>", ":vertical resize -5<cr>", { desc = "Vertical resize -5" })
vim.keymap.set("n", "<leader><up>", ":resize +5<cr>", { desc = "Horizontal resize +5" })
vim.keymap.set("n", "<leader><down>", ":resize -5<cr>", { desc = "Horizontal resize -5" })
