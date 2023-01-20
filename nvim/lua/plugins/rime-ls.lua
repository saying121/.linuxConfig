return {
    'wlh320/rime-ls',
    keys = {
        '<leader>tr',
    },
    config = function()

        local start_rime = function()
            -- 用户目录的user.yaml 文件配置简体中文
            -- var:
            --   last_build_time: 1674143199
            --   option:
            --     simplification: true
            local client_id = vim.lsp.start_client({
                name = "rime-ls",
                cmd = { '/bin/rime_ls/rime_ls' },
                init_options = {
                    enabled = false, -- 初始关闭, 手动开启
                    shared_data_dir = "/usr/share/rime-data", -- rime 公共目录
                    user_data_dir = vim.fn.getenv('HOME') .. "/.local/share/rime-ls-nvim", -- 指定用户目录, 最好新建一个
                    log_dir = vim.fn.getenv('HOME') .. "/.local/share/rime-ls-nvim", -- 日志目录
                    max_candidates = 10,
                    trigger_characters = {},
                },
            });
            ---@diagnostic disable-next-line: param-type-mismatch
            vim.lsp.buf_attach_client(0, client_id)
            -- 快捷键手动开启
            vim.keymap.set('n', '<leader>tr', function() vim.lsp.buf.execute_command({ command = "toggle-rime" }) end)
        end

        vim.api.nvim_create_autocmd('BufReadPost', {
            callback = function()
                start_rime()
            end,
            pattern = '*',
        })

    end
}
