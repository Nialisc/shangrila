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
        awesome = true;
      };
      work= enabled;
    };
  };

  system.stateVersion = "22.05";
}
