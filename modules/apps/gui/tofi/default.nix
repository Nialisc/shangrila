{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.tofi;
in
{
  options.shangrila.apps.gui.tofi = with types; {
    enable = mkBoolOpt false "Whether or not to enable tofi.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ tofi ];
    };

    #TODO: Add config for tofi and use fontpath
  };
}
