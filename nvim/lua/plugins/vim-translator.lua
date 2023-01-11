local M = {
    'voldikss/vim-translator',
    lazy = true,
    keys = {
        { '<M-y>', mode = {'n','v'}, desc = 'translate' },
    },
}

function M.config()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n','<M-y>','<Plug>TranslateW',opts)
    vim.api.nvim_set_keymap('v','<M-y>','<Plug>TranslateWV',opts)
end
return M
