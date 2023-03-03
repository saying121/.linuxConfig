return {
    'hrsh7th/cmp-nvim-lua',
    ft = 'lua',
    config = function()
        local cmp = require 'cmp'
        cmp.setup.filetype('lua', {
        -- Set configuration for specific filetype.
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
                { name = 'path' },
                { name = 'nerdfonts' },
            })
        })
    end
}
