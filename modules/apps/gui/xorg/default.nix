{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    services.dbus.enable = true;

    services.xserver = {
      enable = true;
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