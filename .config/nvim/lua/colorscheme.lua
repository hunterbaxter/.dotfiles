vim.o.background="light"
vim.o.background="dark"

-- tokyo night
vim.g.tokyonight_style = "night"
vim.g.tokyonight_terminal_colors = "true"
vim.g.tokyonight_day_brightness = "0.4"

local colorscheme = "zenbones"
-- local colorscheme = "rosebones"
local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
