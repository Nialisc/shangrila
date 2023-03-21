{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ eww ];
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/eww" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/eww/config";
        recursive = true;
      };
    };
  };
}
