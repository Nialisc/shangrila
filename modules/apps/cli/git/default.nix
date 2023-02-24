{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.cli.git;
in
{
  options.shangrila.apps.cli.git = with types; {
    enable = mkBoolOpt false "Whether or not to enable git.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ git ]; };
}
