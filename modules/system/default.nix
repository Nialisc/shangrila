{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.system;
in
{
  options.shangrila.system = with types; {
    enable = mkBoolOpt false "Whether or not to enable hardware handling.";
  };

  config = mkIf cfg.enable {
    shangrila.system = {
      nix = enabled;
      audio = enabled;
      network = enabled;
      locale = enabled;
    };

    environment.systemPackages = with pkgs; [
      ntfs3g
      fuseiso
      pciutils
      usbutils
      acpi
      gcc
    ];
  };
}
