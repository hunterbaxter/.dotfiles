local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  vim.notify "formatter is not ok"
  return
end

formatter.setup {
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--config-path " .. "~/.config/stylua/stylua.toml",
          },
          stdin = false,
        }
      end,
    },
    python = {
      function()
        return {
          exe = "black", -- this should be available on your $PATH
          args = { "-" },
          stdin = true,
        }
      end,
    },
  },
}
