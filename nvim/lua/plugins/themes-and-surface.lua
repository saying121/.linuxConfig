return {
    'glepnir/dashboard-nvim',
    'xiyaowong/nvim-transparent',
    'lukas-reineke/indent-blankline.nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'p00f/nvim-ts-rainbow',
        },
    },
    {
        'EdenEast/nightfox.nvim',
        build = ':NightfoxCompile',
        priority = 1000,
        -- lazy = true,
        cond = false,
    },
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        cond = true,
    },
}
