{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.awesome {
    services = {
      xserver = {
        enable = true;
        autorun = false;
        layout = "us";
        xkbVariant = "euro";
        xkbOptions = "eurosign:e";
        libinput = enabled;
        displayManager.startx = enabled;
        displayManager.defaultSession = "none+awesome";
        windowManager.awesome = {
          enable = true;
          package = pkgs.awesome-git;
          luaModules = with pkgs.luaPackages; [ luarocks ];
        };
      };
      dbus = enabled;
      getty.autologinUser = config.shangrila.user.name;
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/awesome" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/awesome/config";
        recursive = true;
      };
      home.file."Pictures/wallpaper.jpg" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/gui/awesome/wallpaper.jpg";
      };
      #TODO: See if the use of xsession could be a better way of doing it
      home.file.".xinitrc" = {
        text = ''
        test -f $HOME/.screenlayout/default.sh && sh $HOME/.screenlayout/default.sh
        exec dbus-launch --exit-with-x11 awesome
        '';
      };
    };
  };
}
