{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.wayland;
in
{
  options.shangrila.apps.wayland = with types; {
    enable = mkBoolOpt false "Whether or not to enable Wayland DE.";
  };

  config = mkIf cfg.enable {
    shangrila.apps.wayland = {
      hyprland = enabled;
      tofi = enabled;
    };

    environment.systemPackages = with pkgs; [
      grim
      wbg
    ];
  };
}
