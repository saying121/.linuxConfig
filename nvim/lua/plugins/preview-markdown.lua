return {
    'iamcco/markdown-preview.nvim',
    lazy = true,
    -- 需要调整nodejs版本
    build = 'source /usr/share/nvm/init-nvm.sh; nvm use v18; cd app && npm install',
    ft = { 'markdown' },
    config = function()
        local opts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set('n', '<c-p>', ':MarkdownPreviewToggle<cr>', opts)
    end
}
