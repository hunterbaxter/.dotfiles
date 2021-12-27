-- these cause errors if included in the rest of the options
vim.g.auto_save = false

-- ttps://www.youtube.com/watch?v=hY5-Q6NxQgY&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=2
-- ^ is a great video on options
-- :help options
local options = {
    backup = true,
    clipboard = "unnamedplus",
    hidden = true,
    ignorecase = true,
    incsearch = true,
    mouse = "a",
    ruler = true,
    smartcase = true,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    timeoutlen = 400,
    updatetime = 250,
    completeopt = { "menu", "noinsert", "noselect" },
    number = true,
    numberwidth = 3,
    relativenumber = true,
    signcolumn = "yes",
    autoindent = true,
    expandtab = true,
    -- TODO: have tab size change per language,
    softtabstop = 4,
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true,
    modeline = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]] -- makes "-" part of a word

vim.o.backspace = [[indent,eol,start]]

-- Disable NeoVim Intro
vim.opt.shortmess:append("sI")
vim.opt_global.shortmess:remove("F"):append("c")

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>hl")

-- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758
vim.cmd("let &fcs='eob: '")

-- disabling plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.cmd([[autocmd FileType json syntax match Comment +\/\/.\+$+]])
