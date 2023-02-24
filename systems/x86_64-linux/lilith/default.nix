{ lib, ... }:

with lib;
{
  imports = [ ./hardware.nix ];

  shangrila = {
    system = enabled;
    apps = enabled;
  };

  system.stateVersion = "22.05";
}
