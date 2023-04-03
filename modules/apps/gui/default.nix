{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  options.shangrila.apps.gui = with types; {
    enable = mkBoolOpt false "Whether or not to enable gui apps.";
    wayland = mkBoolOpt false "Whether or not to use wayland.";
    xorg = mkBoolOpt false "Whether or not to use xorg.";
    nvidia = mkBoolOpt false "Whether or not to use nvidia drivers.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        feh
        mpv
        light
        xfce.thunar
        chromium
      ] ++ optionals cfg.wayland [
        wev
        slurp
        swww
      ] ++ optionals cfg.xorg [
        arandr
        autorandr
        xev
        maim
        nitrogen
      ];
    };

    services.xserver.videoDrivers = mkIf cfg.nvidia [ "nvidia" ];
    hardware.opengl.enable = true;
  };
}
