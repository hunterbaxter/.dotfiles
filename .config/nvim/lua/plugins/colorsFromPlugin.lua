-- BEGIN: tokyonight colorscheme
-- 'folke/tokyonight.nvim',
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- vim.cmd[[colorscheme tokyonight]]
-- END: tokyonight colorscheme

-- BEGIN: github colorscheme
-- 'projekt0n/github-nvim-theme',
-- require("github-theme").setup({
    -- themeStyle = "dark",
    -- functionStyle = "italic",
    -- sidebars = {"qf", "vista_kind", "terminal", "packer"},
    -- transparent = true,
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    -- colors = {hint = "orange", error = "#ff0000"}
-- })
-- END: github colorscheme

-- BEGIN: material colorscheme
-- 'marko-cerovac/material.nvim'
vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false
--vim.g.material_custom_colors = { black = "#000000", bg = "#0F111A" }
require('material').set()
