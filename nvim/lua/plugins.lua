return {
    {
        'terror/chatgpt.nvim',
        build = 'pip3 install -r requirements.txt'
    },
    'eandrju/cellular-automaton.nvim',
    {
        'turbio/bracey.vim',
        build = 'npm install --prefix server',
        ft = { 'html' },
    },
    'adelarsq/image_preview.nvim',
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        ft = { 'markdown' },
    },
    --  'rcarriga/nvim-notify'
    {
        'ggandor/leap.nvim',
        dependencies = {
            'ggandor/flit.nvim',
        },
    },
    {
        'michaelb/sniprun',
        build = './install.sh',
    },
    'stevearc/aerial.nvim',
    {
        'LintaoAmons/scratch.nvim',
        version = 'v0.2.0', --  tag for stability, or without this to have latest fixed and functions
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
        },
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- file icons
        },
        version = 'nightly', -- optional, updated every week. (see issue #1193)
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            "ahmedkhalf/project.nvim",
        },
        version = '0.1.0',
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'jose-elias-alvarez/null-ls.nvim',
        },
    },
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'jayp0521/mason-nvim-dap.nvim',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'f3fora/cmp-spell',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    },
    --  'hrsh7th/cmp-vsnip'
    --  'hrsh7th/vim-vsnip'

    --  {
    --     'neoclide/coc.nvim',
    --     branch = 'release'
    -- }
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'p00f/nvim-ts-rainbow',
        },
    },
    'lukas-reineke/indent-blankline.nvim',
    --  'itchyny/vim-cursorword'
    {
        'EdenEast/nightfox.nvim',
        build = ':NightfoxCompile',
        -- priority = 1000,
        -- lazy = true,
        -- enabled = false,
        cond = false,
    },
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        cond = true,
    },
    'wookayin/vim-autoimport', --导入包
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'voldikss/vim-floaterm',
    'xiyaowong/nvim-transparent',
    'glepnir/dashboard-nvim',
    'steelsojka/pears.nvim',
    'numToStr/Comment.nvim',
    'tpope/vim-surround',
    'voldikss/vim-translator',
    'folke/lazy.nvim',
}
