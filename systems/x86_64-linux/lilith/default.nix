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
        wayland = true;
      };
    };
  };

  system.stateVersion = "22.05";
}
