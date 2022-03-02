{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.charles;

in

{
  options = with lib; {
    my = {
      modules = {
        charles = {
          enable = mkEnableOption ''
            Whether to enable charles module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "charles"
        ];
      };
    };
}
