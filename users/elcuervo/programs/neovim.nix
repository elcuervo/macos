{ pkgs, lib, ... }:

let
  nvim-treesitter-endwise = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-treesitter-endwise";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "nvim-treesitter-endwise";
      rev = "0cf4601c330cf724769a2394df555a57d5fd3f34";
      sha256 = "sha256-J1cKq/Ctw8Vj7RL3D9AnSezS+8Ugm+nfgXz7KjfKtVo=";
    };
  };
in

{
  enable = true;
  package = pkgs.neovim-unwrapped;

  withNodeJs = false;
  withPython3 = false;
  withRuby = false;

  extraConfig = builtins.concatStringsSep "\n" [
    (lib.strings.fileContents ./neovim/config.vim)
  ];

  extraLuaConfig = builtins.concatStringsSep "\n" [
    (lib.strings.fileContents ./neovim/config.lua)
    #    (lib.strings.fileContents ./neovim/plugins/treesitter.lua)
  ];

  extraPackages = with pkgs; [
    yaml-language-server
    dhall-lsp-server
  ];

  plugins = with pkgs.vimPlugins; [
    # General
    supertab
    sensible
    nerdtree
    mkdir-nvim

    # Navigation
    plenary-nvim
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-ui-select-nvim

    # UI
    {
      plugin = onedark-nvim;
      config = "colorscheme onedark";
    }

    lualine-nvim
    nvim-web-devicons
    trouble-nvim

    vim-bbye
    gitsigns-nvim

    vim-fugitive
    webapi-vim
    vim-gist
    vim-tmux-navigator
    vim-carbon-now-sh

    # LSP
    nvim-lspconfig

    # Syntax
    nvim-treesitter.withAllGrammars
    nvim-treesitter-refactor
    nvim-treesitter-endwise
    vim-matchup
    dhall-vim
  ];
}
