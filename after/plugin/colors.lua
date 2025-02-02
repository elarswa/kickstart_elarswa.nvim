local utils = require("utils")

utils.print_script_path()

function ColorMeImpressed() 
    color = color or "onedark_vivid"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.cmd.hi 'Comment gui=none'
end

ColorMeImpressed()
