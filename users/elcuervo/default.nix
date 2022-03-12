{ pkgs, inputs, system, lib, ... }:

let
  username = "elcuervo";
  fullname = "elcuervo";

in

{
  imports = [
    ../modules
  ];

  my = {
    username = "${username}";

    modules = {
      dock = {
        enable = true;

        entries = [
          { path = "/System/Applications/Launchpad.app"; }
          { path = "/Applications/iTerm.app"; }
          { path = "/System/Applications/Mail.app"; }
          {
            path = "/Users/${username}/Downloads/";
            section = "others";
            options = "--sort dateadded --view grid --display folder";
          }
        ];
      };
    };
  };

  users = {
    users = {
      "${username}" = {
        description = "${fullname}";
        shell = pkgs.fish;
        home = "/Users/${username}";
      };
    };
  };

  home-manager.users."${username}" = { config, ... }: {
    home = {
      homeDirectory = "/Users/${username}";

      sessionPath = [
        "$HOME/.local/bin"
      ];

      packages = with pkgs; [
        # QoL
        nixpkgs-fmt

        tree-sitter
        nodejs # github copilot

        # extra language servers
        solargraph
        rnix-lsp
        terraform-lsp
        terraform-ls
        nodePackages.typescript
        nodePackages.typescript-language-server
        gopls

        # debugging
        delve # golang
      ];
    };

    programs = {
      home-manager.enable = true;

      bat.enable = true;

      exa = {
        enable = true;
        enableAliases = true;
      };

      gh = {
        enable = true;
        settings = {
          editor = "nvim";
          git_protocol = "ssh";
        };
      };

      alacritty = import ./programs/alacritty.nix { inherit pkgs; };
      direnv = import ./programs/direnv.nix { inherit pkgs; };
      fzf = import ./programs/fzf.nix { inherit pkgs; };
      neovim = import ./programs/neovim.nix { inherit pkgs lib; };
      readline = import ./programs/readline.nix { inherit pkgs; };
      ssh = import ./programs/ssh.nix { inherit pkgs; };
      #zsh = import ./programs/zsh.nix { inherit pkgs; };
      fish = import ./programs/fish.nix { inherit pkgs; };
      tmux = import ./programs/tmux.nix { inherit pkgs; };
    };
  };
}
