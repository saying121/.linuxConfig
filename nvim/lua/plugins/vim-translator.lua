local M = {
    'voldikss/vim-translator',
    lazy = true,
    keys = {
        { '<M-y>', mode = { 'n', 'v' }, desc = 'translate' },
    },
}

function M.config()
    local opts = { noremap = true, silent = true }
    -- Available: 'bing', 'google', 'haici', 'iciba'(expired), 'sdcv', 'trans', 'youdao'
    vim.cmd "let g:translator_default_engines=['google','haici']"
    vim.api.nvim_set_keymap('n', '<M-y>', '<Plug>TranslateW', opts)
    vim.api.nvim_set_keymap('v', '<M-y>', '<Plug>TranslateWV', opts)
    -- """ Configuration example
    -- " Echo translation in the cmdline
    -- nmap <silent> <Leader>t <Plug>Translate
    -- vmap <silent> <Leader>t <Plug>TranslateV
    -- " Display translation in a window
    -- nmap <silent> <Leader>w <Plug>TranslateW
    -- vmap <silent> <Leader>w <Plug>TranslateWV
    -- " Replace the text with translation
    -- nmap <silent> <Leader>r <Plug>TranslateR
    -- vmap <silent> <Leader>r <Plug>TranslateRV
    -- " Translate the text in clipboard
    -- nmap <silent> <Leader>x <Plug>TranslateX
end

return M
