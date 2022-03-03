{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.notion;

in

{
  options = with lib; {
    my = {
      modules = {
        notion = {
          enable = mkEnableOption ''
            Whether to enable notion module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "notion"
        ];
      };
    };
}
