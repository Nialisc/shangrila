{ options, config, lib, pkgs, ... }:

with lib;
let 
  cfg = config.shangrila.apps.gui;
in
{
  config = mkIf (cfg.enable && cfg.xorg) {
    environment.systemPackages = with pkgs; [ bspwm ];
    services = {
      xserver = {
        windowManager.bspwm = enabled;
        displayManager.defaultSession = "none+bspwm";
      };
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/bspwm" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/bspwm/config";
        recursive = true;
      };
    };

  };
}