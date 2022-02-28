{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.bitwarden;

in

{
  options = with lib; {
    my = {
      modules = {
        rectangle = {
          enable = mkEnableOption ''
            Whether to enable bitwarden module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "bitwarden"
        ];
      };
    };
}
