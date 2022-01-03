local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
  vim.notify "treesitter not ok"
  return
end

ts_config.setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "json",
    "latex",
    "lua",
    "python",
    "rust",
    "yaml",
  },
  sync_install = false,
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true, disable = { "" } },
}
