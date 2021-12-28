local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig is not working")
  return
end

-- require("user.lsp.installer")
-- require("user.lsp.handlers").setup()
require("lsp.installer")
require("lsp.handlers").setup()
