local utils = require("utils")

utils.print_script_path()

vim.g.mapleader = " "

-- normal
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = '[E]xplorer' } )
vim.keymap.set("n", "n", "nzz") -- center after find jump
vim.keymap.set("n", "N", "Nzz") -- center after find jump reverse
vim.keymap.set("n", "J", "mzJ`z") -- don't move cursor on line join
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- visual
vim.keymap.set("v", "p", "pgvy") -- retain yank buffer when pasting over selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
