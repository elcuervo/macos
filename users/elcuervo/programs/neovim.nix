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
in

{
  enable = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = ''
    syntax on
  '';

  extraPackages = with pkgs; [
    yaml-language-server
  ];

  plugins = with pkgs.vimPlugins; [
    supertab
    sensible
    nerdtree

    # UI
    {
      plugin = onedark-nvim;
      config = "colorscheme onedark";
    }

    lualine-nvim
    nvim-web-devicons
    trouble-nvim
  ];
}
