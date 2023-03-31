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

    hardware.pulseaudio.enable = mkForce false;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;

      wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [ pavucontrol pulsemixer ];
  };
}
