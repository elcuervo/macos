{ pkgs, lib, ... }:

{
  enable = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = builtins.concatStringsSep "\n" [
    (lib.strings.fileContents ./neovim/config.vim)
    (lib.strings.fileContents ./neovim/plugins.vim)

    (lib.strings.fileContents ./neovim/plugins/lspsaga.vim)
    (lib.strings.fileContents ./neovim/plugins/cmp.vim)
    (lib.strings.fileContents ./neovim/plugins/telescope.vim)

    ''
      lua << EOF
      ${lib.strings.fileContents ./neovim/config.lua}

      ${lib.strings.fileContents ./neovim/plugins/lspconfig.lua}
      ${lib.strings.fileContents ./neovim/plugins/treesitter.lua}
      ${lib.strings.fileContents ./neovim/plugins/lualine.lua}
      EOF
    ''
  ];

  plugins = with pkgs.vimPlugins; [
    supertab
    sensible
    gruvbox

    # UI
    lightline-vim
    lightline-gruvbox-vim
    nvim-web-devicons

    vim-fugitive
    webapi-vim
    vim-gist
    vim-tmux-navigator

    # LSP
    nvim-lspconfig
    nvim-cmp
    cmp-nvim-lsp
    lspsaga-nvim
    luasnip
    lspkind-nvim

    # Navigation
    plenary-nvim
    telescope-nvim
    lualine-nvim

    # Highlight
    nvim-treesitter

    # Languages
    vim-endwise
    vim-ruby
    vim-rails
    vim-terraform

    vim-nix
  ];
}
