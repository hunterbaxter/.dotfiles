local modules = {
  "keymaps",
  "options",
  "plugins",
  "colorscheme",
  "completion",
  "lsp"
}

-- for i = 1, #modules, 1 do
--     pcall(require, modules[i])
-- end
local user = "hunter"
for i = 1, #modules, 1 do
    local status_ok, _ = pcall(require, modules[i])
    if not status_ok then
        vim.notify(modules[i] .. " not ok")
    end
end
