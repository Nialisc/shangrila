{ lib, ... }:

with lib;
{
  imports = [ ./hardware.nix ];

  shangrila = {
    system = enabled;
    apps = {
      cli = enabled;
      gui = enabled;
      work = enabled;
    };
  };

  system.stateVersion = "22.05";
}
