{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ betterlockscreen ];
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/betterlockscreenrc" = {
      source =
        hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/betterlockscreen/config/betterlockscreenrc";
      };
    };
  };
}
