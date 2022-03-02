{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.grandperspective;

in

{
  options = with lib; {
    my = {
      modules = {
        grandperspective = {
          enable = mkEnableOption ''
            Whether to enable grandperspective module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "grandperspective"
        ];
      };
    };
}
