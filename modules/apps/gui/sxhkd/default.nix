{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ sxhkd ];
      sessionVariables = {
        SXHKD_SHELL = "/bin/sh";
      };
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/sxhkd" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/sxhkd/config";
        recursive = true;
      };
    };
  };
}