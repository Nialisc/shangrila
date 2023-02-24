{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.cli.alacritty;
in
{
  options.shangrila.apps.cli.alacritty = with types; {
    enable = mkBoolOpt false "Whether or not to enable git.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ git ]; };
}
