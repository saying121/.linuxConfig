local M = {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    keys = {
        { '<leader>ff', mode = 'n', desc = 'find file' },
        { '<leader>fw', mode = 'n', desc = 'find word' },
        { '<leader>bf', mode = 'n', desc = 'find in buffer ' },
        { '<leader>go', mode = 'n', desc = 'list oldfiles' },
        { '<sapce>ll', mode = 'n', desc = 'list diagnostics' },
        { '<space>a', mode = 'n', desc = '' },
    },
    dependencies = {
        'ahmedkhalf/project.nvim',
        keys = {
            { '<space>p',
                -- '<Plug>TranslateW',
                desc = 'project.nvim' },
        },
    },
    version = '0.1.0',
}

function M.dependencies.config()

    require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true
        },
    })

    require 'telescope'.load_extension('projects')
    -- require 'telescope'.extensions.projects.projects {}

    vim.api.nvim_set_keymap('n', '<space>p', '<CMD>Telescope projects<cr>', { noremap = true })
    -- vim.cmd('nnoremap <space>p :Telescope projects<CR>')

    require 'project_nvim'.setup {
        -- Manual mode doesn't automatically change your root directory, so you have
        -- the option to manually do so using `:ProjectRoot` command.
        manual_mode = false,

        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = { "lsp", "pattern" },

        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

        -- Table of lsp clients to ignore by name
        -- eg: { "efm", ... }
        ignore_lsp = {},

        -- Don't calculate root dir on specific directories
        -- Ex: { "~/.cargo/*", ... }
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- When set to false, you will get a message when project.nvim changes your
        -- directory.
        silent_chdir = true,

        -- What scope to change the directory, valid options are
        -- * global (default)
        -- * tab
        -- * win
        scope_chdir = 'global',

        -- Path where project.nvim will store the project history for use in
        -- telescope
        datapath = vim.fn.stdpath("data"),
    }

end

function M.config()

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
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    keymap('n', '<leader>ff', builtin.find_files, opts)
    keymap('n', '<leader>fw', builtin.live_grep, opts)
    keymap('n', '<leader>bf', builtin.buffers, opts)
    keymap('n', '<leader>go', builtin.oldfiles, opts)
    keymap('n', '<space>a', builtin.treesitter, opts)
    keymap('n', '<space>ll', builtin.diagnostics, opts)

end

return M
