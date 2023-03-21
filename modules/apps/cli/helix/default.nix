{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.cli;
in
{
  config =
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [ helix ];
        sessionVariables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
        };
      };

      shangrila.home.extraOptions = hm: {
        home.file.".config/helix" = {
          source =
            hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/cli/helix/config";
          recursive = true;
        };
      };
    };
}
