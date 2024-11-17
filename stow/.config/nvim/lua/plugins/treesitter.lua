return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    configs = {
      ensure_install = { "html", "json", "javascript", "typescript", "python", "lua", "go", "rust", "css" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
