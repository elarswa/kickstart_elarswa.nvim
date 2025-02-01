local utils = require("utils")

utils.print_script_path()

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

