-- TODO: Detect filetypes and have zenobes for markdown and tex, github colorblind for the rest
vim.o.background = "light" -- default
-- vim.o.background = "dark"
local time = os.date "*t"
if time.hour < 6 or time.hour >= 18 then
  vim.o.background = "dark"
end

-- local colorscheme = "zenbones"
local colorscheme = "neobones"
-- local colorscheme = "vimbones" -- when one wants a light mode with more warmth
-- local colorscheme = "github_dark_colorblind"
-- vim.g.github_transparent = true
-- local colorscheme = "github_light_colorblind"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- local status_ok, gh = pcall(require, "github-theme")
-- if not status_ok then
--   vim.notify "github-theme not ok"
--   return
-- end

-- gh.setup {
-- theme_style = "dark_colorblind",
-- theme_style = "light_colorblind",
-- function_style = "", --
-- comment_style = "italic" -- italic default
-- }
