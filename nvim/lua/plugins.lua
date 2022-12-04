local packer = require('packer')
packer.startup({
    function(use)
        use {
            'iamcco/markdown-preview.nvim', run = 'cd app && npm install',
            setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
            ft = { 'markdown' },
        }
        use 'rcarriga/nvim-notify'
        use 'ggandor/flit.nvim'
        use 'ggandor/leap.nvim'
        use { 'michaelb/sniprun', run = './install.sh' }
        use {
            'stevearc/aerial.nvim',
            config = function() require('aerial').setup() end
        }
        use {
            'LintaoAmons/scratch.nvim',
            tag = 'v0.2.0' -- use tag for stability, or without this to have latest fixed and functions
        }
        use 'adelarsq/image_preview.nvim'
        use {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
        }
        use 'voldikss/vim-floaterm'
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        use 'ahmedkhalf/project.nvim'
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0', --依赖 apt install ripgrep
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-media-files.nvim',
        }
        use {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
        use {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
        }
        use {
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-buffer',
            'L3MON4D3/LuaSnip',
            after = 'nvim-cmp',
        }
        use { 'rafamadriz/friendly-snippets', after = 'LuaSnip' }
        -- use 'hrsh7th/cmp-vsnip'
        -- use 'hrsh7th/vim-vsnip'

        -- use {
        --     'neoclide/coc.nvim',
        --     branch = 'release'
        -- }
        use {
            'z0mbix/vim-shfmt',
            ft = 'sh'
        }
        use 'wookayin/vim-autoimport' --导入包
        use {
            'stsewd/isort.nvim', run = ':UpdateRemotePlugins',
            'averms/black-nvim',
        }
        use {
            'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
            'p00f/nvim-ts-rainbow',
        }
        use 'nvim-lua/popup.nvim'
        -- use 'itchyny/vim-cursorword'
        -- use 'lfv89/vim-interestingwords'
        use 'nvim-lua/plenary.nvim'
        use {
            'EdenEast/nightfox.nvim', run = ':NightfoxCompile',
            'folke/tokyonight.nvim',
            'xiyaowong/nvim-transparent',
            'lukas-reineke/indent-blankline.nvim',
            'glepnir/dashboard-nvim',
        }
        use {
            'steelsojka/pears.nvim',
            'numToStr/Comment.nvim',
            'tpope/vim-surround',
        }
        use 'voldikss/vim-translator'
        use 'wbthomason/packer.nvim'
    end,
    config = {
        profile = {
            enable = true,
            threshold = 1
        },
        display = {
            open_fn = require('packer.util').float,
        },
        --并发数量限制
        max_jobs = 16,
        --自定义源
        git = {
            cmd = 'git', -- The base command for git operations
            subcommands = { -- Format strings for git subcommands
                update         = 'pull --ff-only --progress --rebase=false',
                install        = 'clone --depth %i --no-single-branch --progress',
                fetch          = 'fetch --depth 999999 --progress',
                checkout       = 'checkout %s --',
                update_branch  = 'merge --ff-only @{u}',
                current_branch = 'branch --show-current',
                diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
                diff_fmt       = '%%h %%s (%%cr)',
                get_rev        = 'rev-parse --short HEAD',
                get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
                submodules     = 'submodule update --init --recursive --progress'
            },
            depth = 1, -- Git clone depth
            clone_timeout = 60, -- Timeout, in seconds, for git clones     -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
    },
})

--自动安装插件
pcall(vim.cmd, [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
]])

--[[ use {
  'myusername/example',        -- The plugin location string
  -- The following keys are all optional
  disable = boolean,           -- Mark a plugin as inactive
  as = string,                 -- Specifies an alias under which to install the plugin
  installer = function,        -- Specifies custom installer. See "custom installers" below.
  updater = function,          -- Specifies custom updater. See "custom installers" below.
  after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
  rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
  opt = boolean,               -- Manually marks a plugin as optional.
  bufread = boolean,           -- Manually specifying if a plugin needs BufRead after being loaded
  branch = string,             -- Specifies a git branch to use
  tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
  commit = string,             -- Specifies a git commit to use
  lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
  run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
  requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
  rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
  config = string or function, -- Specifies code to run after this plugin is loaded.
  -- The setup key implies opt = true
  setup = string or function,  -- Specifies code to run before this plugin is loaded.
  -- The following keys all imply lazy-loading and imply opt = true
  cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
  ft = string or list,         -- Specifies filetypes which load this plugin.
  keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
  event = string or list,      -- Specifies autocommand events which load this plugin.
  fn = string or list          -- Specifies functions which load this plugin.
  cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
  module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
                               -- with one of these module names, the plugin will be loaded.
  module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When requiring a string which matches one of these patterns, the plugin will be loaded.
} ]]
