return {
    {
        'iamcco/markdown-preview.nvim',
        lazy = true,
        build = 'cd app && npm install',
        ft = { 'markdown' },
    },
    {
        'turbio/bracey.vim',
        lazy = true,
        build = 'npm install --prefix server',
        ft = { 'html' },
    },
}
