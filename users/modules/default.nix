{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./macos.nix

    ./bartender.nix
    ./grandperspective.nix
    ./notion.nix
    ./spotify.nix
    ./chrome.nix
    ./dock.nix
    ./docker.nix
    ./etcher.nix
    ./git.nix
    ./gpg.nix
    ./hammerspoon.nix
    ./iterm.nix
    ./ngrok.nix
    ./rectangle.nix
    ./signal.nix
    ./telegram.nix
    ./slack.nix
    ./zoom.nix
    ./charles.nix
  ];

  my = {
    modules = {
      macos = {
        enable = lib.mkDefault true;
      };

      bartender = {
        enable = lib.mkDefault true;
      };

      grandperspective = {
        enable = lib.mkDefault true;
      };

      notion = {
        enable = lib.mkDefault true;
      };

      spotify = {
        enable = lib.mkDefault true;
      };

      chrome = {
        enable = lib.mkDefault true;
      };

      dock = {
        enable = lib.mkDefault false;
      };

      docker = {
        enable = lib.mkDefault true;
      };

      etcher = {
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

      iterm = {
        enable = lib.mkDefault true;
      };

      ngrok = {
        enable = lib.mkDefault true;
      };

      rectangle = {
        enable = lib.mkDefault true;
      };

      signal = {
        enable = lib.mkDefault true;
      };

      telegram = {
        enable = lib.mkDefault true;
      };

      slack = {
        enable = lib.mkDefault true;
      };

      zoom = {
        enable = lib.mkDefault true;
      };

      charles = {
        enable = lib.mkDefault true;
      };
    };
  };
}
