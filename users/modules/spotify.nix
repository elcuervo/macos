{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.spotify;

in

{
  options = with lib; {
    my = {
      modules = {
        spotify = {
          enable = mkEnableOption ''
            Whether to enable spotify module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "spotify"
        ];
      };
    };
}
