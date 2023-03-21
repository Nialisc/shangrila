{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ herbstluftwm ];
    services = {
      xserver = {
        enable = true;
        autorun = false;
        layout = "us";
        xkbVariant = "euro";
        xkbOptions = "eurosign:e";
        libinput = enabled;
        displayManager.startx = enabled;
        displayManager.defaultSession = "none+herbstluftwm";
        windowManager.herbstluftwm = enabled;
      };
      dbus = enabled;
      getty.autologinUser = config.shangrila.user.name;
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/herbstluftwm" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/herbstluftwm/config";
        recursive = true;
      };
      home.file."Pictures/wallpaper.jpg" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/herbstluftwm/wallpaper.jpg";
      };
      #TODO: See if the use of xsession could be a better way of doing it
      home.file.".xinitrc" = {
        text = ''
        ${cfg.XtraConfig}
        exec dbus-launch --exit-with-x11 herbstluftwm
        '';
      };
    };
  };
}
