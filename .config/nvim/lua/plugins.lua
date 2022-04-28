-- https://copr.fedorainfracloud.org/coprs/agriffis/neovim-nightly/
-- https://arongriffis.com/2019-03-02-neovim-nightly-builds
-- https://arongriffis.com/2019-04-15-neovim-nightlies-revisited
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
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require "completion"
    end,
  }
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      "jose-elias-alvarez/null-ls.nvim",
      -- "simrat39/rust-tools.nvim",
    },
    config = function()
      require "lsp.init"
    end,
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require "_plugins.treesitter"
    end,
  }
  -- colorschemes
  use "projekt0n/github-nvim-theme"
  use 'folke/tokyonight.nvim'
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim",
  }
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require "_plugins.gitsigns"
    end,
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      -- "nvim-lua/popup.nvim",
      -- "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      require "_plugins.telescope"
    end,
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require "_plugins.whichKey"
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
    ft = { "tex", "bib" },
    config = function()
      vim.cmd "source ~/.dotfiles/.config/nvim/lua/_plugins/vimtex.vim"
    end,
  }
  use {
    "Pocco81/TrueZen.nvim",
    ft = { "tex", "bib", "markdown" },
    config = function()
      require "_plugins.zen"
    end,
  }
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
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require "_plugins.toggleterm"
    end,
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
