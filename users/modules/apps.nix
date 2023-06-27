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
          hackrf
        ];
      };

      homebrew = {
        casks = [
          "bartender"
          "cron"
          "ledger-live"
          "karabiner-elements"
          "rectangle"
          "raycast"
          "dropshare"
          "loom"
          "loopback"
          "handbrake"
          "arduino-ide"
          "tor-browser"
          "postman"
          "amazon-photos"
          "beeper"
          "brave-browser"

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
