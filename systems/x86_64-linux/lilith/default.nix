{ lib, ... }:

with lib;
{
  imports = [ ./hardware.nix ];

  shangrila = {
    nix = enabled;
  };

  system.stateVersion = "22.05";
}
