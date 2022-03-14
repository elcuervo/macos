{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.twitter;

in

{
  options = with lib; {
    my = {
      modules = {
        twitter = {
          enable = mkEnableOption ''
            Whether to enable twitter module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "twitter"
        ];
      };
    };
}
