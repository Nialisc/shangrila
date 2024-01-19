{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf (cfg.enable && cfg.nvidia) {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}