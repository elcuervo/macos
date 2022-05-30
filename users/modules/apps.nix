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
        ];
      };

      homebrew = {
        casks = [
          "blender"

          "bartender"
          "karabiner-elements"
          "rectangle"
          "alfred"
          "dropshare"
          "loom"
          "loopback"

          "grandperspective"
          "notion"
          "spotify"
          "google-chrome"
          "balenaetcher"
          "iterm2"
          "vlc"

          "charles"
          "gqrx"

          "fliqlo"

          "signal"
          "telegram"
          "slack"
          "zoom"
        ];
      };
    };
}
