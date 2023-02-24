{ lib, ... }:

with lib;
{
  imports = [ ./hardware.nix ];

  shangrila = {
    nix = enabled;

    apps.gui = enabled;
  };

  system.stateVersion = "22.05";
}
