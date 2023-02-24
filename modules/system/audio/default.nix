{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.system.audio;
in
{
  options.shangrila.system.audio = with types; {
    enable = mkBoolOpt false "Whether or not to enable audio managment.";
  };

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
  };
}
