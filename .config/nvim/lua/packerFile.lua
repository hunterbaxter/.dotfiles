-- want metals for scala 
-- want orgmode
-- want webdevicons
-- want telescope
-- want bolder line numbers or at least a way to toggle
-- want plus/- characters on gitsigns to work on tokyonight 
-- tab completion is not workign?
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- use 'lervag/vimtex'
    use {
        'marko-cerovac/material.nvim',
        -- 'folke/tokyonight.nvim',
        -- 'projekt0n/github-nvim-theme',
        config = function()
            require "plugins.colorsFromPlugin"
        end
    }
    use {
        "nvim-lua/plenary.nvim",
        event = "BufRead"
    }
    use {
        "kabouzeid/nvim-lspinstall",
        event = "BufRead"
    }
    use {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = function()
            require "plugins.lspconfig"
        end
    }
    use {
        'scalameta/nvim-metals',
        -- config = function()
             -- require "plugins.metals"
        -- end
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
    -- use {
        -- 'nvim-telescope/telescope.nvim',
        -- after = "plenary.nvim",
        -- -- requires = {'nvim-lua/popup.nvim'},
        -- config = function()
            -- require "plugins.telescope"
        -- end
    -- }
end)
