{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.xorg.dunst;
in
{
  options.shangrila.apps.xorg.dunst = with types; {
    enable = mkBoolOpt false "Whether or not to enable dunst.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ dunst libnotify ];
    };
  };
}
