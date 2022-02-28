{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.zoom;

in

{
  options = with lib; {
    my = {
      modules = {
        zoom = {
          enable = mkEnableOption ''
            Whether to enable zoom module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "zoom"
        ];
      };
    };
}
