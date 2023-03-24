{ lib, ... }:

with lib;
{
  imports = [ ./hardware.nix ];

  shangrila = {
    system = enabled;
    apps = {
      cli = enabled;
      gui = {
        enable = true;
        nvidia = true;
      };
    };
  };

  system.stateVersion = "22.05";
}
