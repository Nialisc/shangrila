{ lib, ... }:

with lib;
with lib.shangrila;
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
      work = enabled;
    };
  };

  system.stateVersion = "23.11";
}
