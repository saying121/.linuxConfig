return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = require("plugins.telescopes.telescope_keys"),
    ft = { "dashboard" },
    version = "0.1.0",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        require("plugins.telescopes.telescope-fzf-native"),
        require("plugins.telescopes.project"),
    },
    config = function()
        local builtin, keymap = require("telescope.builtin"), vim.keymap.set
        local opts = { noremap = true, silent = true }

        keymap("n", "<leader>ff", builtin.find_files, opts)
        keymap("n", "<leader>fw", builtin.live_grep, opts)
        keymap("n", "<leader>bf", builtin.buffers, opts)
        keymap("n", "<leader>go", builtin.oldfiles, opts)
        keymap("n", "<space>a", builtin.treesitter, opts)
        keymap("n", "<M-p>", ":Telescope projects<CR>", opts)

        require("telescope").load_extension("projects")

        require("telescope").setup({
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key",
                    },
                },
                layout_config = {
                    vertical = { width = 0.5 },
                    -- other layout configuration here
                },
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
                file_browser = {
                    theme = "ivy",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    -- mappings = {
                    --   ["i"] = {
                    --     -- your custom insert mode mappings
                    --   },
                    --   ["n"] = {
                    --     -- your custom normal mode mappings
                    --   },
                    -- },
                },
            },
        })
    end,
}
