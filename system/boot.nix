{ ... }:

{
  imports = [ ./hardware-configuration.nix ];
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchVariables = true;
  };
}