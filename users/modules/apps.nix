{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.apps;
in

{
  options = with lib; {
    my = {
      modules = {
        apps = {
          enable = mkEnableOption ''
            Whether to enable apps module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          ngrok
          hackrf
        ];
      };

      homebrew = {
        enable = true;
        autoUpdate = true;

        casks = [
          "bartender"
          "karabiner-elements"
          "rectangle"
          "raycast"
          "dropshare"
          "loom"
          "loopback"
          "handbrake"
          "arduino-ide"
          "tor-browser"

          "grandperspective"
          "timemachineeditor"
          "gpg-suite"
          "obsidian"
          "spotify"
          "google-chrome"
          "balenaetcher"
          "iterm2"
          "vlc"

          "charles"
          "gqrx"
          "tableplus"
          "protonvpn"

          "fliqlo"

          "signal"
          "telegram"
          "slack"
          "discord"
          "zoom"
        ];
      };
    };
}
