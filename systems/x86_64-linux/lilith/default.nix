{ lib, ... }:

with lib;
{
  imports = [ ./hardware.nix ];

  shangrila = {
    system = enabled;
    apps = {
      gui = enabled;
      cli = enabled;
      xorg = enabled;
    };
  };

  system.stateVersion = "22.05";
}
