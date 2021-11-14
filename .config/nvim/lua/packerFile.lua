-- want orgmode0
-- want webdevicons
-- want bolder line numbers or at least a way to toggle
-- should figure out how to incorporate fuzzy finder
-- want nvim crates in status line to have better scope
-- TODO: get native lsp working instead of coc
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        "kabouzeid/nvim-lspinstall",
        event = "BufRead"
    }
    -- use {
    --     'neoclide/coc.nvim',
    --     branch='release',
    -- }
    use {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = function()
            require "plugins.lspconfig"
        end
    }
    -- Something changed with metals, and I don't write scala enough to fix currently
    -- use {
    --     'scalameta/nvim-metals',
    --     requires = "nvim-lua/plenary.nvim"
    --     config = function()
    --         require "plugins.metals"
    --     end
    -- }
    use {
        "mcchrish/zenbones.nvim",
        requires = "rktjmp/lush.nvim",
        config = function()
            require "plugins.zenbones"
        end
    }
    use {
        "nvim-lua/plenary.nvim",
        event = "BufRead"
    }
    use {
        "lewis6991/gitsigns.nvim",
        after = "plenary.nvim",
        config = function()
            require "plugins.gitsigns"
        end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        event = "BufRead",
        run = ":TSUpdate",
        config = function()
            require "plugins.treesitter"
        end
    }
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require "plugins.compe"
        end,
        wants = "LuaSnip",
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function()
                    require "plugins.luasnip"
                end
            },
            {
                "rafamadriz/friendly-snippets",
                event = "InsertCharPre"
            }
        }
    }
    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require "plugins.autopairs"
        end
    }
    use "nvim-telescope/telescope-fzf-native.nvim"
    use {
        'nvim-telescope/telescope.nvim',
        after = "plenary.nvim",
        config = function()
            require "plugins.telescope"
        end
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require "plugins.whichKey"
        end
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup{}
        end
    }
    use {'jdhao/whitespace.nvim', event = 'VimEnter'}
end)
