{ options, config, lib, pkgs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    programs.hyperland = {
      enable = true;
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config//hypr" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/wayland/config";
        recursive = true;
      };
    };

    environment.sessionVariables = {
      XDG_CURRENT_DESKTOP = "hyprland";
    };

    services.dbus.enable = true;
  };
}