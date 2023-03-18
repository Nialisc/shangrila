{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ dconf lxappearance ];

    shangrila.home.extraOptions = {
      gtk = {
        enable = true;
        theme = {
          name = "Catppuccin-Frappe-Compact-Rosewater-Dark";
          package = pkgs.catppuccin-gtk;
        };
        cursorTheme = {
          name = "Dracula-cursors";
          package = pkgs.dracula-theme;
          size = 16;
        };
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
      };
    };
  };
}
