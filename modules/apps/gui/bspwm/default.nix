{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.bspwm;
in
{
  options.shangrila.apps.gui.bspwm = with types; {
    enable = mkBoolOpt false "Whether or not to enable bspwm.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ bspwm ];
    services.xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "euro";
      windowManager.bspwm.enable = true;
      displayManager = { 
        defaultSession = "none+bspwm";
      };
    };
    shangrila.home.configFile."bspwm/bspwmrc" = {
      source = ./config.sh;
      executable = true;
    };
  };
}
