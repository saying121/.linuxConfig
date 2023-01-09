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

vim.api.nvim_set_keymap(
    "n",
    "<leader>e",
    "<cmd>NvimTreeToggle<CR>",
    { silent = true, noremap = true }
)
