return {
    {
        'skywind3000/asynctasks.vim',
        dependencies = {
            'skywind3000/asyncrun.vim',
        }
    },
    {
        'terror/chatgpt.nvim',
        lazy = true,
        build = 'pip3 install -r requirements.txt'
    },
    --  'rcarriga/nvim-notify'

    --  {
    --     'neoclide/coc.nvim',
    --     branch = 'release'
    -- },
    --  'itchyny/vim-cursorword'
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'folke/lazy.nvim',
}
