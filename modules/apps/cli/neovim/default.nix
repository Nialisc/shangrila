{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.cli.neovim;
in
{
  options.shangrila.apps.cli.neovim = with types; {
    enable = mkBoolOpt false "Whether or not to enable neovim.";
  };

  config =
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [ neovim ];
        sessionVariables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
        };
      };
    };
}
