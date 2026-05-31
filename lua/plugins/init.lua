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

    -- UI
    { "nvim-tree/nvim-web-devicons", opts = {} },
    'folke/which-key.nvim',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
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
