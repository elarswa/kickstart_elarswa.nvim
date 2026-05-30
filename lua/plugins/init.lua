return {
    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = { 'nvim-lua/plenary.nvim',
        -- optional but recommended
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },

    -- Colorscheme
    'olimorris/onedarkpro.nvim',

    -- Syntax / Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })()
        end,
    },
    -- UI
    'folke/which-key.nvim',
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
    },

    -- Git
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    -- Navigation
    'ThePrimeagen/harpoon',

    -- Editing
    'kylechui/nvim-surround',

    -- LSP
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
}
