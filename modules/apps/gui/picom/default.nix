{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.picom;
in
{
  options.shangrila.apps.gui.picom = with types; {
    enable = mkBoolOpt false "Whether or not to enable picom.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ picom ];
    };
    shangrila.home.configFile."picom/picom.conf".source = ./config;
  };
}
