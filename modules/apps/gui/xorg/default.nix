{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf (cfg.enable && cfg.xorg) {
    services.dbus.enable = true;

    services.xserver = {
      enable = true;
      windowManager.bspwm.enable = true;
      displayManager = {
        defaultSession = "none+bspwm";
        lightdm = {
          enable = true;
          greeter.enable = true;
        };
      };

      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
          sendEventsMode = "disabled-on-external-mouse";
        };
      };
    };
  };
}