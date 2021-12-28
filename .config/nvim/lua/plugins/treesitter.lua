local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
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
    highlight = {
        enable = true,
        use_languagetree = true
    }
}

