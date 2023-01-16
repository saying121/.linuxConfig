return {
    'glepnir/dashboard-nvim',
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
            vim.cmd [[autocmd UIENTER,VimEnter * :TransparentEnable | source ~/.config/nvim/viml/statusline-config.vim]]
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
        'EdenEast/nightfox.nvim',
        build = ':NightfoxCompile',
        -- priority = 1000,
        lazy = true,
        config = function()

            require('nightfox').setup({
                options = {
                    -- Compiled file's destination location
                    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                    compile_file_suffix = "_compiled", -- Compiled file suffix
                    transparent = false, -- Disable setting background
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false, -- Non focused panes set to alternative background
                    styles = { -- Style to be applied to different syntax groups
                        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "NONE",
                        keywords = "bold",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "NONE",
                        variables = "NONE",
                    },
                    inverse = { -- Inverse highlight for different types
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                    modules = { -- List of various plugins and additional options
                        -- ...
                    },
                },
                palettes = {},
                specs = {},
                groups = {},
            })

        end
    },
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        cond = true,
        config = function()

            -- vim.cmd [[colorscheme tokyonight]]
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
