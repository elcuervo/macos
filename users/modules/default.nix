{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./macos.nix

    ./apps.nix

    ./dock.nix
    ./docker.nix
    ./git.nix
    ./gpg.nix
    ./hammerspoon.nix
  ];

  my = {
    modules = {
      macos = {
        enable = lib.mkDefault true;
      };

      apps = {
        enable = lib.mkDefault true;
      };

      dock = {
        enable = lib.mkDefault false;
      };

      docker = {
        enable = lib.mkDefault true;
      };

      git = {
        enable = lib.mkDefault true;
      };

      gpg = {
        enable = lib.mkDefault true;
      };

      hammerspoon = {
        enable = lib.mkDefault true;
      };
    };
  };
}
