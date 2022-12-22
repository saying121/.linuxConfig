require 'telescope'.setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },
        layout_config = {
            vertical = { width = 0.5 }
            -- other layout configuration here
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg" -- find command (defaults to `fd`)
        },
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            -- mappings = {
            --   ["i"] = {
            --     -- your custom insert mode mappings
            --   },
            --   ["n"] = {
            --     -- your custom normal mode mappings
            --   },
            -- },
        },
    },
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<leader>bf', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<leader>go', builtin.oldfiles, { noremap = true })
vim.keymap.set('n', '<space>a', builtin.treesitter, { noremap = true })
vim.keymap.set('n', '<space>ll', builtin.diagnostics, { noremap = true })
