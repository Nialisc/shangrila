{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.dunst;
in
{
  options.shangrila.apps.gui.dunst = with types; {
    enable = mkBoolOpt false "Whether or not to enable dunst.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ dunst libnotify ];
    };
  };
}
