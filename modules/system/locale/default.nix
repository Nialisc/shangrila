{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.system.locale;
in
{
  options.shangrila.system.locale = with types; {
    enable = mkBoolOpt false "Whether or not to enable locale managment.";
  };

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
      font = "Lat2-Terminus16";
      keyMap = "us";
    };
  };
}
