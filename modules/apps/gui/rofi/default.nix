{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; 
        optionals cfg.wayland [ rofi-wayland ] ++
        optionals cfg.xorg [ rofi ];
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/rofi" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/rofi/config";
        recursive = true;
      };
    };
  };
}