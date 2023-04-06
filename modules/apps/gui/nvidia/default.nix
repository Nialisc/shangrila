{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf (cfg.enable && cfg.nvidia) {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}