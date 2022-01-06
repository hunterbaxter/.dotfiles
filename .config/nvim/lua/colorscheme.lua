vim.o.background = "light" -- default
local time = os.date "*t"
if time.hour < 6 or time.hour >= 18 then
  vim.o.background = "dark"
end

-- tokyo night
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_terminal_colors = "true"
-- vim.g.tokyonight_day_brightness = "0.4"

local colorscheme = "zenbones"
-- local colorscheme = "vimbones" \\ when one wants a light mode with more warmth
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
