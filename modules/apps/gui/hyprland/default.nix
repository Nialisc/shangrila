{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf (cfg.enable && cfg.wayland) {
    programs.hyprland = {
      enable = true;
      xwayland = {
        enable = true;
        hidpi = true;
      };
    };

    environment.sessionVariables = {
      XDG_CURRENT_DESKTOP = "hyprland";
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/hypr" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/hyprland/config";
        recursive = true;
      };
    };
  };
}