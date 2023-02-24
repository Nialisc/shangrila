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
      autorun = false;
      layout = "us";
      xkbVariant = "euro";
      xkbOptions = "eurosign:e";
      libinput = enabled;
      displayManager.startx = enabled;
      displayManager.defaultSession = "none+bspwm";
      windowManager.bspwm = enabled;
    };
    shangrila.home.configFile."bspwm/bspwmrc" = {
      source = ./config;
      executable = true;
    };

    #TODO: See why we need it and what is launched if none
    shangrila.home.file.".xinitrc" = {
      text = "exec bspwm";
    };
  };
}
