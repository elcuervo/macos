{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./homebrew.nix

    ./fonts.nix
    ./nix.nix
    ./shells.nix
    ./sudoers.nix
    ./tools.nix
  ];

  my = {
    modules = {
      homebrew = {
        enable = true;
      };

      fonts = {
        enable = true;
      };

      nix = {
        enable = true;
      };

      shells = {
        enable = true;
      };

      sudoers = {
        enable = true;
      };

      tools = {
        enable = true;
      };
    };
  };
}
