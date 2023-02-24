{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.mako;
in
{
  options.shangrila.apps.gui.mako = with types; {
    enable = mkBoolOpt false "Whether or not to enable mako.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ mako libnotify ];
    };

    #TODO: Add config for mako
  };
}
