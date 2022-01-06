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
  vim.notify "packer not ok"
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

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    run = ":TSUpdate",
    config = function()
      require "_plugins.treesitter"
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
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim",
  }
  use "folke/tokyonight.nvim"
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "_plugins.gitsigns"
    end,
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require "_plugins.whichKey"
    end,
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require "_plugins.lualine"
    end,
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }
  use {
    "lervag/vimtex",
    -- ft = {"tex", "bib"},
    config = function()
      vim.cmd "source ~/.dotfiles/.config/nvim/lua/_plugins/vimtex.vim"
    end,
  }
  -- use {
  --   "Pocco81/TrueZen.nvim",
  --   -- ft = {"tex", "bib"},
  --   config = function()
  --     require "_plugins.zen"
  --   end,
  -- }
  use {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    run = "cd app && yarn install",
  }
  use {
    "McAuleyPenney/tidy.nvim",
    event = "BufWritePre",
  }
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "_plugins.tree"
    end,
  }
  use {
    "mhartington/formatter.nvim",
    config = function()
      require "_plugins.formatter"
    end,
  }
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require "_plugins.autopairs"
    end,
  }
  use {
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
    config = function()
      require "_plugins.bufferline"
    end,
  }
  -- use {
  --   use "akinsho/toggleterm.nvim",
  --   config = function()
  --     require "_plugins.toggleterm"
  --   end,
  -- }
  -- use {
  --   "brymer-meneses/grammar-guard.nvim",
  --   requires = {
  --     "neovim/nvim-lspconfig",
  --     "williamboman/nvim-lsp-installer",
  --   },
  --   config = function()
  --     require "_plugins.grammar"
  --   end,
  -- }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
