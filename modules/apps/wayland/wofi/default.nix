{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.wayland.wofi;
in
{
  options.shangrila.apps.wayland.wofi = with types; {
    enable = mkBoolOpt false "Whether or not to enable wofi.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ wofi ];
    };
  };
}
