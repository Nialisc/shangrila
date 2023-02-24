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

    shangrila.home.configFile."electron-flags.conf".source =
      ./electron-flags.conf;

    environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };

    environment.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };

    shangrila.home.configFile."hypr/hyprland.conf" = {
      source = ./config;
    };
    
    shangrila.home.file."Pictures/wallpaper.jpg" = {
      source = ./wallpaper.jpg;
    };
  };
}
