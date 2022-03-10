{ pkgs, ... }:

{
  enable = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = builtins.concatStringsSep "\n" [
    (lib.strings.fileContents ./config.vim)
  ];

  extraPackages = with pkgs; [
      # used to compile tree-sitter grammar
      tree-sitter

      # https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
      nodePackages.typescript nodePackages.typescript-language-server
      gopls
      rust-analyzer
    ];

  plugins = with pkgs.vimPlugins; [
    supertab
    sensible
    gruvbox

    lightline-vim
    lightline-gruvbox-vim

    vim-fugitive
    webapi-vim
    vim-gist
    vim-tmux-navigator

    # LSP
    nvim-lspconfig

    # Languages
    vim-endwise
    vim-ruby
    vim-rails
    vim-terraform

    vim-nix
  ];
}
