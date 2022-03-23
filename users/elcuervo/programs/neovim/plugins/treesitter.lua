-- Use homebrew gcc version
require'nvim-treesitter.install'.compilers = { "/opt/homebrew/bin/gcc-11" }

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
    "nix",
    "yaml"
  },

  autotag = {
    enable = true,
  }
}
