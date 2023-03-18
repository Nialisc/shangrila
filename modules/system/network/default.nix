{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.system;
in
{
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
