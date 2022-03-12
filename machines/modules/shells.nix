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
      # Just delete /etc/shells, everything is going to be ok
      #
      environment.shells = with pkgs; [ zsh fish ];

      programs = {
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
