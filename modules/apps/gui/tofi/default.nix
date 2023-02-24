{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.tofi;
in
{
  options.shangrila.apps.gui.tofi = with types; {
    enable = mkBoolOpt false "Whether or not to enable tofi.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ tofi ];
    };

    #TODO: Add config for tofi and use fontpath
    shangrila.home.extraOptions = hm: {
      home.file.".config/tofi" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/gui/tofi/config";
        recursive = true;
      };
    };
  };
}
