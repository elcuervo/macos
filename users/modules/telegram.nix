{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.telegram;

in

{
  options = with lib; {
    my = {
      modules = {
        telegram = {
          enable = mkEnableOption ''
            Whether to enable telegram module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "telegram"
        ];
      };
    };
}
