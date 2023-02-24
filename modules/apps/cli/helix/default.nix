{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.cli.helix;
in
{
  options.shangrila.apps.cli.helix = with types; {
    enable = mkBoolOpt false "Whether or not to enable helix.";
  };

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
            hm.config.lib.file.mkOutOfStoreSymlink "/home/nialis/.nix/modules/apps/cli/helix/config";
          recursive = true;
        };
      };
    };
}
