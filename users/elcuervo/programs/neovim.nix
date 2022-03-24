{ pkgs, lib, ... }:

let
  nvim-treesitter-endwise = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-treesitter-endwise";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "nvim-treesitter-endwise";
      rev = "f653101e056cebcee71b47b8adb93d3a878cda36";
      sha256 = "sha256-J1cKq/Ctw8Vj7RL3D9AnSezS+8Ugm+nfgXz7KjfKtVo=";
    };
  };

  catppuccin = pkgs.vimUtils.buildVimPlugin {
    name = "catppuccin-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "nvim";
      rev = "f079dda3dc23450d69b4bad11bfbd9af2c77f6f3";
      sha256 = "sha256-8N7y2Swhgy1N9nVmuh3KJq0666zUEt5TIeU4SmYYn50=";
    };
  };
in

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

    # UI
    gruvbox
    catppuccin
    lualine-nvim
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

    # Highlight
    nvim-treesitter
    nvim-treesitter-context
    nvim-treesitter-endwise
  ];
}
