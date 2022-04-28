-- TODO: Detect filetypes and have zenobes for markdown and tex, github colorblind for the rest
-- rational is I want zenbones for markdown and tex, but actual syntax highlihgting for rust, python, and shell

-- this can automatically detect time of day to switch to dark mode
-- vim.o.background = "dark"
-- local time = os.date "*t"
-- if time.hour < 6 or time.hour >= 18 then
--   vim.o.background = "dark"
-- end

-- local colorscheme = "vimbones" -- when one wants a light mode with more warmth
-- vim.g.github_transparent = true

vim.o.background = "light"
local style = ""
local theme_name = ""
local lua_theme = false

-- theme_name = "github-theme"
theme_name = "tokyonight"
-- theme_name = "neobones"

-- vim cmd themes

if theme_name == "github-theme" then
  style = "light_default"
  -- style = "light_colorblind"
  -- style = "light"
elseif theme_name == "tokyonight" then
  vim.g.tokyonight_style = "night"
  style = "night"
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_day_brightness = 0.2
  vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
end


if lua_theme then
  local status_ok, theme = pcall(require, theme_name)
  if not status_ok then
    vim.notify "github-theme not ok"
    return
  end
  theme.setup {
    theme_style = style,
    transparent = true,
  }
  -- making bracket highlighting brighter
  vim.cmd [[:highlight MatchParen cterm=none ctermbg=green ctermfg=blue]]
else
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme_name)
    if not status_ok then
      vim.notify("colorscheme " .. theme_name .. " not found!")
      return
    end
end
