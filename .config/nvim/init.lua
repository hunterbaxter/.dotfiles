local modules = {
  "user.keymaps",
  "user.options",
  "user.plugins",
  "user.colorscheme",
  "user.completion",
  "user.lsp"
}

-- for i = 1, #modules, 1 do
--     pcall(require, modules[i])
-- end

for i = 1, #modules, 1 do
    local status_ok, _ = pcall(require, modules[i])
    if not status_ok then
        vim.notify(modules[i] .. " not ok")
    end
end
