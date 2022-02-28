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

      finder = {
        enable = true;

        entries = [
          {
            path = "/Users/${username}";
            alias = "Home";
          }
          {
            path = "/Applications";
            alias = "Applications";
          }
          {
            path = "/Users/${username}/Desktop";
            alias = "Desktop";
          }
          {
            path = "/Users/${username}/Downloads";
            alias = "Downloads";
          }
          {
            path = "/Users/${username}/code";
            alias = "Code";
          }
        ];
      };
    };
  };

  users = {
    users = {
      "${username}" = {
        description = "${fullname}";
        shell = pkgs.zsh;
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
    };

    programs = {
      home-manager.enable = true;

      bat.enable = true;

      alacritty = import ./programs/alacritty.nix { inherit pkgs; };
      direnv = import ./programs/direnv.nix { inherit pkgs; };
      fzf = import ./programs/fzf.nix { inherit pkgs; };
      neovim = import ./programs/neovim.nix { inherit pkgs; };
      readline = import ./programs/readline.nix { inherit pkgs; };
      ssh = import ./programs/ssh.nix { inherit pkgs; };
      starship = import ./programs/starship.nix { inherit pkgs; };
    };
  };
}
