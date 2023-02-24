{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.wayland.hyprland;
in
{
  options.shangrila.apps.wayland.hyprland = with types; {
    enable = mkBoolOpt false "Whether or not to enable Hyprland.";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      xwayland = {
        enable = true;
        hidpi = false;
      };
      nvidiaPatches = false;
    };
    
    shangrila.home.file."~/Pictures/wallpaper.jpg" = {
      source = ./wallpaper.jpg;
    };
  };
}
