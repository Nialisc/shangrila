{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  options.shangrila.apps.gui = with types; {
    enable = mkBoolOpt false "Whether or not to enable gui apps.";
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
        arandr
        autorandr
        xorg.xev
        maim
        nitrogen
        gparted
        meld
        betterlockscreen
        obs-studio
        vieb
        dunst
      ];
    };

    hardware.opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [
        vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
