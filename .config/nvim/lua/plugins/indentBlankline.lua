vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"},
    space_char_blankline = " ",
    show_current_context = true,
}
