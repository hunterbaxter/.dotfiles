-- nvim-lsp-installer
local lsp_installer = require("nvim-lsp-installer")

local servers = {
  "bashls",
  "clangd",
  "eslintls",
  "sumneko_lua",
  "pyright",
  "texlab",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local default_opts = {
    on_attach = on_attach,
  }

  -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
  local server_opts = {
    -- Provide settings that should only apply to the "eslintls" server
    ["eslintls"] = function()
      default_opts.settings = {
        format = {
          enable = true,
        },
      }
    end,
  }

   -- Use the server's custom settings, if they exist, otherwise default to the default options
  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)
