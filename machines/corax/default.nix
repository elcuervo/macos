{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules
  ];

  networking = {
    hostName = "corax";
    computerName = "corax";
  };
}
