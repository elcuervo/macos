require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "ruby",
    "go",
    "toml",
    "fish",
    "json",
    "yaml",
    "html",
  },
  autotag = {
    enable = true,
  }
}
