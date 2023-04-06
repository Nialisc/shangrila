{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    services.xserver.displayManager = {
      lightdm = {
        enable = true;
        greeter = enabled;
        extraConfig = ''
        background=/home/nialis/Pictures/Wallpapers/wallpaper.png
        theme-name=Catppuccin
        icon-name=Papirus-Dark
        '';
      };
    };
  };
}