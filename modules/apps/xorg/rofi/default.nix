{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.xorg.rofi;
in
{
  options.shangrila.apps.xorg.rofi = with types; {
    enable = mkBoolOpt false "Whether or not to enable rofi.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ rofi ];
    };
  };
}
