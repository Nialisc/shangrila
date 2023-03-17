{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.rofi;
in
{
  options.shangrila.apps.gui.rofi = with types; {
    enable = mkBoolOpt false "Whether or not to enable rofi.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ rofi ];
    };
  };
}