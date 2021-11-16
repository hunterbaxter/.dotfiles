vim.g.mapleader = " "
vim.g.auto_save = false

-- global options
local g = vim.o
g.backspace = [[indent,eol,start]]
-- g.clipboard = "unnamedplus"
g.hidden = true
g.ignorecase = true
g.incsearch = true
g.mouse = 'a'
g.ruler = true
g.smartcase = true
g.splitbelow = true
g.splitright = true
g.termguicolors = true
g.timeoutlen = 400
g.updatetime = 250

-- Disable NeoVim Intro
vim.opt.shortmess:append("sI")
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")


-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>hl")

-- local to window options
local w = vim.wo
-- w.cursorline = true
-- w.cursorcolumn = true
w.number = true
w.numberwidth = 3
w.relativenumber = true
w.signcolumn = "yes"

-- local to buffer options
local b = vim.bo
b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false

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
