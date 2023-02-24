{ lib, ... }:

with lib;
{
  imports = [ ./hardware.nix ];

  shangrila = {
    nix = enabled;

    apps.gui = enabled;
    apps.cli = enabled;
  };

  system.stateVersion = "22.05";
}
