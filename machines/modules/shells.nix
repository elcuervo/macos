{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.shells;

in

{
  options = with lib; {
    my = {
      modules = {
        shells = {
          enable = mkEnableOption ''
            Whether to enable shells module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      programs = {
        # Had to manually add the shell to /etc/shells
        bash = {
          enable = true;
        };

        zsh = {
          enable = true;
        };

        fish = {
          enable = true;
        };
      };
    };
}
