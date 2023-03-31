{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  options.shangrila.apps.gui = with types; {
    enable = mkBoolOpt false "Whether or not to enable gui apps.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        arandr
        feh
        mpv
        light
        xfce.thunar
        chromium
        slurp
      ];
    };
  };
}
