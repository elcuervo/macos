{ pkgs, lib, ... }:

{
  enable = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = builtins.concatStringsSep "\n" [
    (lib.strings.fileContents ./neovim/config.vim)

    ''
      lua << EOF
      ${lib.strings.fileContents ./neovim/lsp.lua}
      EOF
    ''
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
    nvim-cmp
    cmp-nvim-lsp

    # Languages
    vim-endwise
    vim-ruby
    vim-rails
    vim-terraform

    vim-nix
  ];
}
