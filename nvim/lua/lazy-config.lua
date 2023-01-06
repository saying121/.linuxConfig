require 'lazy'.setup({
    {
        'terror/chatgpt.nvim',
        build = 'pip3 install -r requirements.txt'
    },
    'eandrju/cellular-automaton.nvim',
    {
        'iamcco/markdown-preview.nvim', build = 'cd app && npm install',
        init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
        ft = { 'markdown' },
    },
    --  'rcarriga/nvim-notify'
    'ggandor/flit.nvim',
    'ggandor/leap.nvim',
    { 'michaelb/sniprun', build = './install.sh' },
    'stevearc/aerial.nvim',
    {
        'LintaoAmons/scratch.nvim',
        version = 'v0.2.0' --  tag for stability, or without this to have latest fixed and functions
    },
    'adelarsq/image_preview.nvim',
    {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
    },
    'voldikss/vim-floaterm',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- file icons
        },
        version = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
        "ahmedkhalf/project.nvim",
    },
    {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'jayp0521/mason-nvim-dap.nvim',
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
        }
    },
    --  'hrsh7th/cmp-vsnip'
    --  'hrsh7th/vim-vsnip'

    --  {
    --     'neoclide/coc.nvim',
    --     branch = 'release'
    -- }
    {
        'z0mbix/vim-shfmt',
        ft = 'sh'
    },
    'wookayin/vim-autoimport', --导入包
    {
        'stsewd/isort.nvim', build = ':UpdateRemotePlugins', ft = 'python'
    },
    { 'averms/black-nvim', ft = 'python' },
    {
        'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
        'p00f/nvim-ts-rainbow',
    },
    'nvim-lua/popup.nvim',
    --  'itchyny/vim-cursorword'
    'nvim-lua/plenary.nvim',
    {
        'EdenEast/nightfox.nvim', build = ':NightfoxCompile',
        'folke/tokyonight.nvim',
        'xiyaowong/nvim-transparent',
        'lukas-reineke/indent-blankline.nvim',
        'glepnir/dashboard-nvim',
    },
    {
        'steelsojka/pears.nvim',
        'numToStr/Comment.nvim',
        'tpope/vim-surround',
    },
    'voldikss/vim-translator',
    'folke/lazy.nvim'
})
