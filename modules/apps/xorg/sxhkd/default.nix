{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.xorg.sxhkd;
in
{
  options.shangrila.apps.xorg.sxhkd = with types; {
    enable = mkBoolOpt false "Whether or not to enable sxhkd.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ sxhkd ];
      sessionVariables = {
        SXHKD_SHELL = "/bin/sh";
      };
    };
    shangrila.home.configFile."sxhkd/sxhkdrc".source = ./config;
  };
}
