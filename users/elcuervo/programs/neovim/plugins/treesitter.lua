-- Use homebrew gcc version

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },

  indent = {
    enable = false,
    disable = {},
  },

  endwise = {
    enable = true,
  },

  ensure_installed = {
    "ruby",
    "go",
    "toml",
    "fish",
    "json",
    "html",
    "yaml",
    "python",
    "elixir",
    "nix",
    "hcl"
  },

  autotag = {
    enable = true,
  }
}
