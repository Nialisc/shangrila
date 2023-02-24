{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.wayland.tofi;
in
{
  options.shangrila.apps.wayland.tofi = with types; {
    enable = mkBoolOpt false "Whether or not to enable tofi.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ tofi ];
    };

    #TODO: Add config for tofi and use fontpath
  };
}
