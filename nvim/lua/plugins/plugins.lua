return {
    {
        'terror/chatgpt.nvim',
        lazy = true,
        build = 'pip3 install -r requirements.txt'
    },
    --  'rcarriga/nvim-notify'
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
        },
    },
    {
        'neovim/nvim-lspconfig',
        priority = 1000,
        dependencies = {
            'jose-elias-alvarez/null-ls.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'f3fora/cmp-spell',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    },

    --  {
    --     'neoclide/coc.nvim',
    --     branch = 'release'
    -- },
    --  'itchyny/vim-cursorword'
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'folke/lazy.nvim',
}
