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

          "grandperspective"
          "notion"
          "spotify"
          "google-chrome"
          "balenaetcher"
          "iterm2"
          "charles"

          "fliqlo"

          "signal"
          "telegram"
          "slack"
          "zoom"
        ];
      };
    };
}
