local M = {
    'wookayin/vim-autoimport', --导入包
    keys = {
        { '<C-M-CR', mode = { 'n', 'i', 'v' } }
    },
}

function M.config()

    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap({ 'n', 'v' }, '<C-M-CR>', ':ImportSymbol<CR>',opts)
    vim.api.nvim_set_keymap('i', '<C-M-CR>', '<ESC>:ImportSymbol<CR>',opts)

end

return M
