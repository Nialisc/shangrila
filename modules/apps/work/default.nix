{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.apps.gui;
in
{
  options.shangrila.apps.work = with types; {
    enable = mkBoolOpt false "Whether or not to enable work apps.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        slack
        zoom-us
        nginx
      ];
    };
  };
}
