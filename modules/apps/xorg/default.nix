{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.xorg;
in
{
  options.shangrila.apps.xorg = with types; {
    enable = mkBoolOpt false "Whether or not to enable Xorg DE.";
  };

  config = mkIf cfg.enable {
    shangrila.apps.xorg = {
      picom = enabled;
      bspwm = enabled;
      sxhkd = enabled;
      rofi = enabled;
      dunst = enabled;
      betterlockscreen = enabled;
    };

    environment.systemPackages = with pkgs; [
      xclip
      xorg.xev
      arandr
    ];
  };
}
