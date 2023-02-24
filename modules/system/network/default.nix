{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.system.network;
in
{
  options.shangrila.system.network = with types; {
    enable = mkBoolOpt false "Whether or not to enable network managment.";
  };

  config = mkIf cfg.enable {
    networking = {
      wireless.iwd.enable = true;

      networkmanager = {
        enable = true;
        wifi.backend = "iwd";
      };
    };
  };
}
