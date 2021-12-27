vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use "wbthomason/packer.nvim"
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
        "neovim/nvim-lspconfig",
        config = function()
            require "lsp.lspconfig"
        end
    }
    use {
        "williamboman/nvim-lsp-installer",
        config = function()
            require "lsp.lspInstaller"
        end
    }
    use "kosayoda/nvim-lightbulb"
    use "onsails/lspkind-nvim"
    -- use "ray-x/lsp_signature.nvim"
    use {
	"hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "kdheepak/cmp-latex-symbols",
            "ray-x/cmp-treesitter",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
        },
        config = function()
            require("plugins.cmp")
        end,
    }
	use "L3MON4D3/LuaSnip"
    use {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
            require("plugins.autopairs")
        end,
    }
    -- until fedora gets 0.6 this is useless
    -- use {
    --     'nvim-telescope/telescope-fzf-native.nvim',
    --     run = 'make'
    -- }
    -- use {
    --     'nvim-telescope/telescope.nvim',
    --     requires = { {'nvim-lua/plenary.nvim'} },
    --     config = function()
    --         require "plugins.telescope"
    --     end
    -- }
    use {
        -- "folke/tokyonight.nvim",
        "mcchrish/zenbones.nvim",
        requires = "rktjmp/lush.nvim",
        config = function()
            require "plugins.zenbones"
        end
    }
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
          require "plugins.gitsigns"
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
    use {
        'jdhao/whitespace.nvim',
        event = 'VimEnter'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require "plugins.lualine"
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "lervag/vimtex",
        ft = {"tex", "bib"},
        config = function()
            -- BUG: can't use zathura when using a lua configuration file
            vim.cmd("source ~/.dotfiles/.config/nvim/lua/plugins/vimtex.vim")
        end
    }
    use {
        "Pocco81/TrueZen.nvim",
        -- ft = {"tex", "bib"},
        config = function()
            require "plugins.zen"
        end
    }
end)
