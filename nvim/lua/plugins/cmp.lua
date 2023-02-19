return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    keys = {
        { ':', mode = { 'n', 'v', 't' } },
        { '/', mode = { 'n', 'v', 't' } },
        { '?', mode = { 'n', 'v', 't' } },
    },
    dependencies = {
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'f3fora/cmp-spell',
        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                'saadparwaiz1/cmp_luasnip',
                'rafamadriz/friendly-snippets',
            },
        },
        {
            'yao-weijie/cmp-rime',
            config = function()
                require("cmp_rime").setup({
                    -- linux/mac用户只需要从软件源中安装rime
                    -- windows用户可能需要指定librime.dll路径, 没测试过
                    libpath = "librime.so",
                    traits = {
                        -- windows 用户的在小狼毫的程序文件夹
                        shared_data_dir = "/usr/share/rime-data",
                        -- 最好新建一个独立的用户目录, 否则很有可能出问题
                        user_data_dir = vim.fn.getenv('HOME') .. "/.local/share/rime-ls-nvim",
                        log_dir = "/tmp/cmp-rime",
                    },
                    enable = {
                        global = false, -- 全局开启, 不建议
                        comment = true, -- 总是在comment中开启
                        -- 其他情况手动开关
                    },
                    auto_commit = false, -- 五笔/音形类方案可用, 唯一候选项自动上屏
                    number_select = 5, -- 映射1-5为数字选词, 最大支持到9, 0表示禁用
                })
                vim.keymap.set({ "i" }, "<C-g>", function() require("cmp_rime").mapping.toggle() end,
                    { desc = "toggle rime" })
            end
        },
    },
    config = function()
        local kind_icons = {
            Text = "",
            Method = "m",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        }

        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require 'cmp'
        local compare = require 'cmp.config.compare'

        local cmp_rime=require'cmp_rime'
        cmp.setup({
            -- matching = {
            --     disallow_fuzzy_matching = true,
            --     disallow_partial_fuzzy_matching = true,
            --     disallow_partial_matching = true,
            --     disallow_prefix_unmatching = true,
            -- },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                    vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            buffer = "[Buf]",
                            path = "[Path]",
                            luasnip = "[LuaSnip]",
                            spell = "[spell]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[Latex]",
                        })[entry.source.name]
                    return vim_item
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs( -1),
                ['<C-f>'] = cmp.mapping.scroll_docs(1),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

                -- ["<C-Space>"] = require("cmp_rime").mappings.toggle_menu,
                ["<Space>"] = require("cmp_rime").mapping.space_commit,
                -- ["<CR>"] = require("cmp_rime").mappings.confirm,

                ["<C-n>"] = cmp_rime.mapping.select_next_item,
                ["<C-p>"] = cmp_rime.mapping.select_prev_item,
                -- 或者这样, 目前是等效的
                -- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                -- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

                ["."] = require("cmp_rime").mapping.page_down,
                [","] = require("cmp_rime").mapping.page_up,

                [";"] = require("cmp_rime").mapping["2"],
                ["'"] = require("cmp_rime").mapping["3"],
                -- 数字选词也可独立设置, 可设置1-9
                ["1"] = require("cmp_rime").mapping["1"],

            }),
            sources = cmp.config.sources({
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'path' },
                { name = 'buffer' },
            }, {
                { name = 'spell' },
                { name = 'nerdfonts' },
                { name = 'rime' }
            }),
            experimental = {
                ghost_text = true
            },
            sorting = { -- rime-ls
                comparator = {
                    require("cmp.config.compare").sort_text, -- 这个放第一个, 其他的随意
                    compare.sort_test,
                    compare.offset,
                    compare.exact,
                    compare.score,
                    compare.recently_used,
                    compare.kind,
                    compare.length,
                    compare.order,
                },
            },
        })
        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                { name = 'buffer' },
            })
        })
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
        vim.opt.spell = true
        vim.opt.spelllang = { 'en_us' }
    end
}
