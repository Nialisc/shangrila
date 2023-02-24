{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.sxhkd;
in
{
  options.shangrila.apps.gui.sxhkd = with types; {
    enable = mkBoolOpt false "Whether or not to enable sxhkd.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ sxhkd ];
    shangrila.home.configFile."sxhkd/shxkdrc".source = ./config;
  };
}
