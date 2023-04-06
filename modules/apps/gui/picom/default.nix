{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ picom ];

    shangrila.home.extraOptions = hm: {
      home.file.".config/picom" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/picom/config";
        recursive = true;
      };
    };
  };
}