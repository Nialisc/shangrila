{ lib, ... }:

with lib;
with lib.internal;
{
  imports = [ ./hardware.nix ];

  shangrila = {
    nix = enabled;
  };

  system.stateVersion = "22.05";
}
