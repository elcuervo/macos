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
        taps = [ "homebrew/core" "homebrew/cask" "homebrew/cask-versions" ];

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
          "openemu-experimental"
          "amazon-photos"

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
