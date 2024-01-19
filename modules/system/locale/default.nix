{ options, config, lib, pkgs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.system;
in
{
  config = mkIf cfg.enable {
    time.timeZone = "Europe/Paris";
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_TIME = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
      };
    };
    console = {
      keyMap = "us";
    };
    fonts.fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
