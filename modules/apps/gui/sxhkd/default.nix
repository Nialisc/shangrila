{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.sxhkd;
in
{
  options.shangrila.apps.gui.sxhkd = with types; {
    enable = mkBoolOpt false "Whether or not to enable sxhkd.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ sxhkd ];
      sessionVariables = {
        SXHKD_SHELL = "/bin/sh";
      };
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/sxhkd" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/gui/sxhkd/config";
        recursive = true;
      };
    };
  };
}