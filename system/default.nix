{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./nix.nix
    ./video.nix
    ./locales.nix
    ./audio.nix
    ./user.nix
  ];

  environment.systemPackages = with pkgs; [
    ntfs3g
    fuseiso
    pciutils
    usbutils
    acpi
    gcc
    inotify-tools
    openssl
  ];
}