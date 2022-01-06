local modules = {
  "keymaps",
  "options",
  "plugins",
  "colorscheme",
}

for i = 1, #modules, 1 do
    local status_ok, _ = pcall(require, modules[i])
    if not status_ok then
        vim.notify(modules[i] .. " not ok")
    end
end
