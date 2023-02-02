return {
    {
        'glepnir/dashboard-nvim',
        event='VimEnter',
    },
    {
        'xiyaowong/nvim-transparent',
        config = function()
            -- 透明
            require("transparent").setup({
                enable = true, -- boolean: enable transparent
                -- extra_groups = all,
                exclude = {}, -- table: groups you don't want to clear
            })
            -- 上面设置true，但是只有编辑区域透明，添加自动命令就没问题
            vim.cmd [[augroup transparent]]
            vim.cmd [[autocmd!]]
            -- 透明后加入状态栏让状态栏有颜色
            vim.cmd [[autocmd UIENTER,VimEnter,BufReadPre * :TransparentEnable | source ~/.config/nvim/viml/statusline-config.vim]]
            vim.cmd [[augroup END]]

        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            -- 缩进线
            vim.opt.termguicolors = true
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }

        end
    },
    {
        'folke/tokyonight.nvim',
        -- priority = 1000,
        -- cond = true,
        -- lazy = true,
        config = function()

            vim.cmd.colorscheme('tokyonight')
            require("tokyonight").setup({
                style = "night",
                transparent = true,
                terminal_colors = true,
                -- Background styles. Can be "dark", "transparent" or "normal"
                styles = {
                    sidebars = "transparent", -- style for sidebars, see below
                    floats = "transparent", -- style for floating windows
                }
            })

        end
    },
}
