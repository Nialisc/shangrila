{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.picom;
in
{
  options.shangrila.apps.gui.picom = with types; {
    enable = mkBoolOpt false "Whether or not to enable picom.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ picom ];
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/picom" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/gui/picom/config";
        recursive = true;
      };
    };
  };
}
