{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.screensaver;

in

{
  options = with lib; {
    my = {
      modules = {
        screensaver = {
          enable = mkEnableOption ''
            Whether to enable fliqlo module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "fliqlo"
        ];
      };
    };
}
