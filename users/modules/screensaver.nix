{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.fliqlo;

in

{
  options = with lib; {
    my = {
      modules = {
        fliqlo = {
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
