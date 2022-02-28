{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules
  ];

  networking = {
    hostName = "poe";
    computerName = "poe";
  };

  system = {
    stateVersion = 4;
  };
}
