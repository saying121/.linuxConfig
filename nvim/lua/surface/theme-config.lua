vim.cmd [[colorscheme tokyonight]]
-- vim.cmd("colorscheme nightfox")

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

require("tokyonight").setup({
    style = "night",
    -- transparent=true,
    terminal_colors = true,
    -- Background styles. Can be "dark", "transparent" or "normal"
    styles = {
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    }
})

-- 分割线
-- require('colorful-winsep').setup({ })
--
-- 透明
require("transparent").setup({
    enable = true, -- boolean: enable transparent
    -- extra_groups = all,
    exclude = {}, -- table: groups you don't want to clear
})
