{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.system;
in
{
  config = mkIf cfg.enable {
    sound = {
      enable = true;
      mediaKeys = {
        enable = true;
      };
    };

    hardware = {
      pulseaudio = {
        enable = true;
        package = pkgs.pulseaudioFull;
        extraConfig = ''
          load-module module-switch-on-connect
        '';
      };
    };

    environment.systemPackages = with pkgs; [ pavucontrol ];
  };
}
