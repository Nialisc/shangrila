{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.xorg.picom;
in
{
  options.shangrila.apps.xorg.picom = with types; {
    enable = mkBoolOpt false "Whether or not to enable picom.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ picom ];
    };
    shangrila.home.configFile."picom/picom.conf".source = ./config;
  };
}
