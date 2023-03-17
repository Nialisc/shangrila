{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.nvidia;
in
{
  options.shangrila.apps.gui.nvidia = with types; {
    enable = mkBoolOpt false "Whether or not to enable nvidia graphics.";
  };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.opengl.enable = true;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
