local modules = {
  "keymaps",
  "options",
  "plugins",
  "colorscheme",
  "completion",
  "lsp"
}

for i = 1, #modules, 1 do
    pcall(require, "user." .. modules[i])
end
