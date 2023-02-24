{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.cli.docker;
in
{
  options.shangrila.apps.cli.docker = with types; {
    enable = mkBoolOpt false "Whether or not to enable docker.";
  };

  config = mkIf cfg.enable {
    virtualisation.docker.enable = true;
    shangrila.user.extraGroups = [ "docker" ];
  };
}
