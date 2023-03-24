{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  options.shangrila.apps.gui = with types; {
    enable = mkBoolOpt false "Whether or not to enable gui apps.";
    nvidia = mkBoolOpt false "Whether or not to enable nvidia drivers.";
  };

  config = mkIf cfg.enable {
    services = mkIf cfg.nvidia {
      xserver.videoDrivers = [ "nvidia" ];
    };

    hardware = mkIf cfg.nvidia {
      opengl.enable = true;
      nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    environment = {
      systemPackages = with pkgs; [
        arandr
        feh
        mpv
        light
        xfce.thunar
        chromium
      ];
    };
  };
}
