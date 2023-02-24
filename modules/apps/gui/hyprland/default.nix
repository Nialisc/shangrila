{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.hyprland;
in
{
  options.shangrila.apps.gui.hyprland = with types; {
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

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
      };
    };

    services.dbus.enable = true;

    shangrila.home.extraOptions = hm: {
      home.file.".config/hypr" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/gui/hyprland/config";
        recursive = true;
      };
      home.file."Pictures/wallpaper.jpg" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/gui/hyprland/wallpaper.jpg";
      };
    };
  };
}
