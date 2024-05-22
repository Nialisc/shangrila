{ pkgs, ... }:

{
  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
    };
  };

  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
    pulse.enable = true;
  };
}