{ options, config, lib, pkgs, ... }:

with lib;
let 
  cfg = config.shangrila.apps.gui.bspwm;
  guiCfg = config.shangrila.apps.gui;
in
{
  options.shangrila.apps.gui.bspwm = with types; {
    enable = mkBoolOpt false "Whether or not to enable bspwm.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ bspwm ];
    services.xserver = {
      enable = true;
      autorun = false;
      layout = "us";
      xkbVariant = "euro";
      xkbOptions = "eurosign:e";
      libinput = enabled;
      displayManager.startx = enabled;
      displayManager.defaultSession = "none+bspwm";
      windowManager.bspwm = enabled;
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/bspwm" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/gui/bspwm/config";
        recursive = true;
      };
      home.file."Pictures/wallpaper.jpg" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/gui/bspwm/wallpaper.jpg";
      };
      #TODO: See if the use of xsession could be a better way of doing it
      home.file.".xinitrc" = {
        text = ''
        ${guiCfg.XtraConfig}
        exec bspwm
        '';
      };
    };

  };
}
