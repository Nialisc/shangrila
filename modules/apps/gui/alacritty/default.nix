{ options, config, lib, pkgs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ alacritty ];
      sessionVariables = {
        TERMINAL = "alacritty";
      };
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/alacritty" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/alacritty/config";
        recursive = true;
      };
    };
  };
}
