{ options, config, lib, pkgs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ vscode ];
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/Code/User/settings.json" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/vscode/config";
      };
    };
  };
}
