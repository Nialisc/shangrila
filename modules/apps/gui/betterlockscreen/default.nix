{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.betterlockscreen;
in
{
  options.shangrila.apps.gui.betterlockscreen = with types; {
    enable = mkBoolOpt false "Whether or not to enable betterlockscreen.";
  };

  config = mkIf cfg.enable {
    shangrila.home.extraOptions.services.betterlockscreen = {
      enable = true;
      arguments = ["--lock"];
    };
  };
}
