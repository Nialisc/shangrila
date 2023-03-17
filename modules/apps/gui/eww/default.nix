{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.eww;
in
{
  options.shangrila.apps.gui.eww = with types; {
    enable = mkBoolOpt false "Whether or not to enable eww.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ eww ];
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/eww" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/gui/eww/config";
        recursive = true;
      };
    };
  };
}
