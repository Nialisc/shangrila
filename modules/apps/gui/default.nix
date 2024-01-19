{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.shangrila;
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
        xfce.thunar
        brave
        gparted
        meld
      ];
    };

    hardware.opengl.enable = true;
  };
}
