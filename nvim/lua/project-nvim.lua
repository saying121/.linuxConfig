require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
})

require('telescope').load_extension('projects')

vim.api.nvim_set_keymap(
    "n",
    "<space>p",
    ":lua require'telescope'.extensions.projects.projects{}<CR>",
    { silent = true, noremap = true }
)
