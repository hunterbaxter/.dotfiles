local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("that didn't work")
  print("that didn't work")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- vim.cmd [[packadd packer.nvim]]
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
    -- use {
    --     "neovim/nvim-lspconfig",
    --     config = function()
    --         require "lsp.lspconfig"
    --     end
    -- }
 --    use {
 --        "williamboman/nvim-lsp-installer",
 --        config = function()
 --            require "lsp.lspInstaller"
 --        end
 --    }
 --    use "kosayoda/nvim-lightbulb"
 --    use "onsails/lspkind-nvim"
 --    -- use "ray-x/lsp_signature.nvim"
 --    use {
	-- "hrsh7th/nvim-cmp",
 --        requires = {
 --            "hrsh7th/cmp-nvim-lsp",
 --            "hrsh7th/cmp-nvim-lua",
 --            "hrsh7th/cmp-buffer",
 --            "hrsh7th/cmp-path",
 --            "hrsh7th/cmp-calc",
 --            "kdheepak/cmp-latex-symbols",
 --            "ray-x/cmp-treesitter",
 --            "saadparwaiz1/cmp_luasnip",
 --            "hrsh7th/cmp-cmdline",
 --            "hrsh7th/cmp-nvim-lsp-document-symbol",
 --        },
 --        config = function()
 --            require("plugins.cmp")
 --        end,
 --    }
	-- use "L3MON4D3/LuaSnip"
 --    use {
 --        "windwp/nvim-autopairs",
 --        after = "nvim-cmp",
 --        config = function()
 --            require("plugins.autopairs")
 --        end,
 --    }
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
    use {
        'iamcco/markdown-preview.nvim',
        -- TODO: only load on correct filetype
        ft = {"markdown"},
        run = 'cd app && yarn install',
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
