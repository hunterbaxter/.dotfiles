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
          -- args = { "-" },
          args = { "-l 80" },
          stdin = false,
        }
      end,
    },
    c = {
        -- clang-format
       function()
          return {
            exe = "clang-format",
            args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
            stdin = true,
            cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
          }
        end
    },
  },
}
