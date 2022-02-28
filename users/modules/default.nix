{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./macos.nix

    ./alfred.nix
    ./bartender.nix
    ./chrome.nix
    ./dock.nix
    ./docker.nix
    ./etcher.nix
    ./git.nix
    ./gpg.nix
    ./hammerspoon.nix
    ./iterm.nix
    ./ngrok.nix
    ./bitwarden.nix
    ./rectangle.nix
    ./signal.nix
    ./telegram.nix
    ./slack.nix
    ./zoom.nix
  ];

  my = {
    modules = {
      macos = {
        enable = lib.mkDefault true;
      };

      alfred = {
        enable = lib.mkDefault false;
      };

      bartender = {
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

      bitwarden = {
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
    };
  };
}
