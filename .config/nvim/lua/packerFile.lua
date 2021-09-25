-- want packer to install if not installed (for reliability)
-- want orgmode
-- want webdevicons
-- want bolder line numbers or at least a way to toggle
-- want plus/- characters on gitsigns to work 
-- should figure out how to incorporate fuzzy finder
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end 
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
        config = function()
            require "plugins.metals"
        end
    }
    use "rktjmp/lush.nvim"
    use {
        "mcchrish/zenbones.nvim",
    --     'sainnhe/gruvbox-material',
    --     config = function()
    --         require "plugins.gruvbox"
    --     end
    -- }
    -- use {
     -- 'marko-cerovac/material.nvim',
     -- use "mcchrish/zenbones.nvim"
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
    -- useful when trying to rice
    use {
        "norcalli/nvim-colorizer.lua",
        -- disable = plugin_status.nvim_colorizer,
        -- event = "BufRead",
        config = function()
            require "plugins.colorizer"
        end
    }
    -- use "nvim-telescope/telescope-fzf-native.nvim"
    use {
        'nvim-telescope/telescope.nvim',
        after = "plenary.nvim",
        config = function()
            require "plugins.telescope"
        end
    }
    -- use {
    --     "folke/which-key.nvim",
    --     config = function()
    --         require "plugins.whichKey"
    --     end
    -- }
end)
