{ config, lib, pkgs, modulesPath, nixos-hardware, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    kernelModules = [ "kvm-intel" ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };

    extraModulePackages = [ ];
  };


  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/bea07cad-8d25-4e82-a6ca-d6c24c672d5d";
      fsType = "ext4";
    };

    "/boot" = { 
      device = "/dev/disk/by-uuid/AA44-FC08";
      fsType = "vfat";
    };

  };
  
  swapDevices =
    [{ device = "/dev/disk/by-uuid/e1472f7c-0602-424e-9108-c64e0b85525d"; }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  #hardware.opengl.enable = true;
  hardware.bluetooth.enable = false;
}
