{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.wayland.mako;
in
{
  options.shangrila.apps.wayland.mako = with types; {
    enable = mkBoolOpt false "Whether or not to enable mako.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ mako libnotify ];
    };

    #TODO: Add config for mako
  };
}
