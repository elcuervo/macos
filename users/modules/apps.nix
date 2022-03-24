{ pkgs, lib, config, options, ... }:

{
  config = with lib;
    mkIf true {
      homebrew = {
        casks = [
          "blender"
        ];
      };
    };
}
