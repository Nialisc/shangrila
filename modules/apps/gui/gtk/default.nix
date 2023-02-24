{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.gtk;
in
{
  options.shangrila.apps.gui.gtk = with types; {
    enable = mkBoolOpt false "Whether or not to enable gtk managment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ dconf lxappearance ];

    shangrila.home.extraOptions = {
      gtk = {
        enable = true;
        theme = {
          name = "Dracula";
          package = pkgs.dracula-theme;
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
