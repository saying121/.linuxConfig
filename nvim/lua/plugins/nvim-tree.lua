local M = {

    'nvim-tree/nvim-tree.lua',
    lazy = true,
    keys = {
        { '<leader>e' },
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- file icons
    },
    version = 'nightly', -- optional, updated every week. (see issue #1193)
}

function M.config()

    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- OR setup with some options
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" },
                    { key = "t", action = "tabnew" },
                },
            },
        },
        renderer = {
            group_empty = true,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            debounce_delay = 50,
            icons = {
                hint = " ",
                info = " ",
                warning = " ",
                error = " ",
            },
        },
        filters = {
            dotfiles = true,
        },
        trash = {
            cmd = "trash-put",
            require_confirm = true,
        },
    })

    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

end

return M
